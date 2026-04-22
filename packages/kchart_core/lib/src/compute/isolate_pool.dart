import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'isolate_messages.dart';

/// Function signature for the task handler running in the worker isolate.
typedef WorkerHandler = FutureOr<Object?> Function(String method, Object? payload);

/// A pool of Isolates to perform heavy computations off the UI thread.
///
/// Uses [TransferableTypedData] for zero-copy memory transfer when possible.
class IsolatePool {
  /// Creates an [IsolatePool] with the specified number of workers.
  ///
  /// Defaults to [Platform.numberOfProcessors] - 1, or 1 if only one processor is available.
  IsolatePool({int? workerCount})
      : _workerCount = workerCount ?? (Platform.numberOfProcessors > 1 ? Platform.numberOfProcessors - 1 : 1);

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
  Future<void> initialize(WorkerHandler handler) async {
    if (_isDisposed) throw StateError('IsolatePool is disposed');
    if (_workers.isNotEmpty) return;

    for (int i = 0; i < _workerCount; i++) {
      final worker = _Worker();
      await worker.start(handler);
      worker.responses.listen(_handleResponse);
      _workers.add(worker);
    }
  }

  /// Computes a task in one of the isolates.
  ///
  /// [method] identifies the operation to perform.
  /// [payload] is the data to process.
  /// [requestId] is an optional unique identifier. If not provided, one will be generated.
  Future<Object?> compute(String method, Object? payload, {String? requestId}) async {
    if (_isDisposed) throw StateError('IsolatePool is disposed');
    if (_workers.isEmpty) throw StateError('IsolatePool is not initialized');

    final id = requestId ?? _generateId();
    final completer = Completer<Object?>();
    _pendingRequests[id] = completer;

    final request = ComputeRequest(requestId: id, method: method, payload: payload);

    // Simple round-robin load balancing
    final worker = _workers[_nextWorkerIndex];
    _nextWorkerIndex = (_nextWorkerIndex + 1) % _workers.length;

    _requestToWorker[id] = worker;
    worker.send(request);

    return completer.future;
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
  String toString() => 'OperationCanceledException: Request $requestId was canceled';
}

class _Worker {
  late Isolate _isolate;
  late SendPort _toIsolate;
  late ReceivePort _fromIsolate;
  final StreamController<ComputeResponse> _responsesController = StreamController.broadcast();

  Stream<ComputeResponse> get responses => _responsesController.stream;

  Future<void> start(WorkerHandler handler) async {
    _fromIsolate = ReceivePort();
    _isolate = await Isolate.spawn(_workerEntry, [_fromIsolate.sendPort, handler]);

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
          final result = await handler(message.method, message.payload);
          if (!canceledRequests.contains(message.requestId)) {
            sendPort.send(ComputeResponse(requestId: message.requestId, payload: result));
          } else {
            canceledRequests.remove(message.requestId);
          }
        } catch (e) {
          if (!canceledRequests.contains(message.requestId)) {
            sendPort.send(ComputeResponse(requestId: message.requestId, error: e.toString()));
          } else {
            canceledRequests.remove(message.requestId);
          }
        }
      }
    });
  }
}
