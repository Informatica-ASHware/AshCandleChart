import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'isolate_messages.dart';

import '../indicators/indicator.dart';
import '../indicators/indicator_registry.dart';
import '../indicators/indicator_pipeline.dart';
import '../series/series.dart';

/// Function signature for the task handler running in the worker isolate.
typedef WorkerHandler =
    FutureOr<Object?> Function(String method, Object? payload);

/// A function that returns an [IndicatorRegistry]. MUST be a top-level or static function.
typedef RegistryProvider = IndicatorRegistry Function();

/// A pool of Isolates to perform heavy computations off the UI thread.
///
/// Uses [TransferableTypedData] for zero-copy memory transfer when possible.
class IsolatePool {
  /// Creates an [IsolatePool] with the specified number of workers.
  ///
  /// Defaults to [Platform.numberOfProcessors] - 1, or 1 if only one processor is available.
  IsolatePool({int? workerCount})
    : _workerCount =
          workerCount ??
          (Platform.numberOfProcessors > 1
              ? Platform.numberOfProcessors - 1
              : 1);

  final int _workerCount;
  final List<_Worker> _workers = [];
  final Map<String, Completer<Object?>> _pendingRequests = {};
  final Map<String, _Worker> _requestToWorker = {};
  int _nextWorkerIndex = 0;
  bool _isDisposed = false;
  int _idCounter = 0;

  /// Initializes the pool by spawning the workers.
  ///
  /// The [handler] MUST be a top-level or static function to be sent to the isolates.
  /// The [registryProvider] is optional and used for indicator batch processing.
  /// It MUST also be a top-level or static function.
  Future<void> initialize(
    WorkerHandler handler, {
    RegistryProvider? registryProvider,
  }) async {
    if (_isDisposed) throw StateError('IsolatePool is disposed');
    if (_workers.isNotEmpty) return;

    for (int i = 0; i < _workerCount; i++) {
      final worker = _Worker();
      await worker.start(handler, registryProvider);
      worker.responses.listen(_handleResponse);
      _workers.add(worker);
    }
  }

  /// Computes a task in one of the isolates.
  ///
  /// [method] identifies the operation to perform.
  /// [payload] is the data to process.
  /// [requestId] is an optional unique identifier. If not provided, one will be generated.
  Future<Object?> compute(
    String method,
    Object? payload, {
    String? requestId,
  }) async {
    if (_isDisposed) throw StateError('IsolatePool is disposed');
    if (_workers.isEmpty) throw StateError('IsolatePool is not initialized');

    final id = requestId ?? _generateId();
    final completer = Completer<Object?>();
    _pendingRequests[id] = completer;

    final request = ComputeRequest(
      requestId: id,
      method: method,
      payload: payload,
    );

    // Simple round-robin load balancing
    final worker = _workers[_nextWorkerIndex];
    _nextWorkerIndex = (_nextWorkerIndex + 1) % _workers.length;

    _requestToWorker[id] = worker;
    worker.send(request);

    return completer.future;
  }

  /// Computes a batch of indicators in one of the isolates.
  Future<Map<String, Object>> computeIndicatorBatch(
    List<IndicatorConfig> configs,
    Series series, {
    String? requestId,
  }) async {
    if (_isDisposed) throw StateError('IsolatePool is disposed');
    if (_workers.isEmpty) throw StateError('IsolatePool is not initialized');

    final id = requestId ?? _generateId();
    final completer = Completer<Object?>();
    _pendingRequests[id] = completer;

    final request = ComputeRequest.indicatorBatch(
      requestId: id,
      configs: configs,
      series: series,
    );

    // Simple round-robin load balancing
    final worker = _workers[_nextWorkerIndex];
    _nextWorkerIndex = (_nextWorkerIndex + 1) % _workers.length;

    _requestToWorker[id] = worker;
    worker.send(request);

    final result = await completer.future;
    return result as Map<String, Object>;
  }

  /// Cancels a pending request by its [requestId].
  void cancel(String requestId) {
    final completer = _pendingRequests.remove(requestId);
    if (completer != null) {
      completer.completeError(OperationCanceledException(requestId));
      final worker = _requestToWorker.remove(requestId);
      if (worker != null) {
        worker.send(ControlMessage.cancel(requestId: requestId));
      }
    }
  }

  String _generateId() {
    return '${DateTime.now().microsecondsSinceEpoch}_${_idCounter++}';
  }

  void _handleResponse(ComputeResponse response) {
    _requestToWorker.remove(response.requestId);
    final completer = _pendingRequests.remove(response.requestId);
    if (completer != null) {
      if (response.error != null) {
        completer.completeError(response.error!);
      } else {
        completer.complete(response.payload);
      }
    }
  }

  /// Disposes the pool and shuts down all isolates.
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;
    for (final worker in _workers) {
      worker.dispose();
    }
    _workers.clear();
    for (final completer in _pendingRequests.values) {
      completer.completeError(StateError('IsolatePool disposed'));
    }
    _pendingRequests.clear();
    _requestToWorker.clear();
  }
}

/// Exception thrown when a computation is canceled.
class OperationCanceledException implements Exception {
  /// Creates an [OperationCanceledException].
  OperationCanceledException(this.requestId);

  /// The ID of the canceled request.
  final String requestId;

  @override
  String toString() =>
      'OperationCanceledException: Request $requestId was canceled';
}

class _Worker {
  late Isolate _isolate;
  late SendPort _toIsolate;
  late ReceivePort _fromIsolate;
  final StreamController<ComputeResponse> _responsesController =
      StreamController.broadcast();

  Stream<ComputeResponse> get responses => _responsesController.stream;

  Future<void> start(
    WorkerHandler handler,
    RegistryProvider? registryProvider,
  ) async {
    _fromIsolate = ReceivePort();
    _isolate = await Isolate.spawn(_workerEntry, [
      _fromIsolate.sendPort,
      handler,
      if (registryProvider != null) registryProvider,
    ]);

    final completer = Completer<SendPort>();
    _fromIsolate.listen((message) {
      if (message is SendPort) {
        completer.complete(message);
      } else if (message is ComputeResponse) {
        _responsesController.add(message);
      }
    });

    _toIsolate = await completer.future;
  }

  void send(Object message) {
    _toIsolate.send(message);
  }

  void dispose() {
    _toIsolate.send(const ControlMessage.exit());
    _isolate.kill(priority: Isolate.immediate);
    _fromIsolate.close();
    _responsesController.close();
  }

  static void _workerEntry(List<Object> args) {
    final sendPort = args[0] as SendPort;
    final handler = args[1] as WorkerHandler;
    final receivePort = ReceivePort();

    sendPort.send(receivePort.sendPort);

    final canceledRequests = <String>{};

    final registryProvider = args.length > 2
        ? args[2] as RegistryProvider
        : null;
    final registry = registryProvider?.call();
    final pipeline = IndicatorPipeline();

    receivePort.listen((message) async {
      if (message is ControlMessage) {
        message.when(
          exit: () {
            receivePort.close();
            Isolate.exit();
          },
          cancel: (id) => canceledRequests.add(id),
        );
        return;
      }

      if (message is ComputeRequest) {
        if (canceledRequests.contains(message.requestId)) {
          canceledRequests.remove(message.requestId);
          return;
        }

        try {
          final result = await message.when(
            (requestId, method, payload) => handler(method, payload),
            indicatorBatch: (requestId, configs, series) {
              if (registry == null) {
                throw StateError(
                  'Indicator batch processing requested but no RegistryProvider was provided during initialization.',
                );
              }
              return pipeline.executeBatch(configs, series, registry);
            },
          );

          if (!canceledRequests.contains(message.requestId)) {
            sendPort.send(
              ComputeResponse(requestId: message.requestId, payload: result),
            );
          } else {
            canceledRequests.remove(message.requestId);
          }
        } catch (e, stack) {
          if (!canceledRequests.contains(message.requestId)) {
            sendPort.send(
              ComputeResponse(
                requestId: message.requestId,
                error: '$e\n$stack',
              ),
            );
          } else {
            canceledRequests.remove(message.requestId);
          }
        }
      }
    });
  }
}
