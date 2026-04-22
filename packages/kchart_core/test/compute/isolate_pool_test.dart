import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:kchart_core/kchart_core.dart';
import 'package:test/test.dart';

// Top-level handler for tests
FutureOr<Object?> testWorkerHandler(String method, Object? payload) async {
  switch (method) {
    case 'echo':
      return payload;
    case 'delay':
      final duration = payload as int;
      await Future.delayed(Duration(milliseconds: duration));
      return 'done';
    case 'float_transfer':
      final transferable = payload as TransferableTypedData;
      final bytes = transferable.materialize().asFloat64List();
      // Simple operation to verify data integrity
      final sum = bytes.reduce((a, b) => a + b);

      // Return back as TransferableTypedData (Zero-Copy)
      final resultList = Float64List(1)..[0] = sum;
      return TransferableTypedData.fromList([resultList.buffer.asUint8List()]);
    default:
      throw Exception('Unknown method: $method');
  }
}

void main() {
  late IsolatePool pool;

  setUp(() async {
    pool = IsolatePool(workerCount: 2);
    await pool.initialize(testWorkerHandler);
  });

  tearDown(() async {
    await pool.dispose();
  });

  test('Basic request/response echo', () async {
    final result = await pool.compute('echo', 'hello');
    expect(result, equals('hello'));
  });

  test('Transfer 500,000 floats round-trip (Zero-Copy)', () async {
    const count = 500000;
    final floats = Float64List(count);
    for (var i = 0; i < count; i++) {
      floats[i] = i.toDouble();
    }

    final transferable = TransferableTypedData.fromList([floats.buffer.asUint8List()]);

    final stopwatch = Stopwatch()..start();
    final result = await pool.compute('float_transfer', transferable);
    stopwatch.stop();

    print('Transfer and sum of $count floats took ${stopwatch.elapsedMilliseconds}ms');

    expect(result, isA<TransferableTypedData>());
    final resultFloats = (result as TransferableTypedData).materialize().asFloat64List();

    // Sum of 0..499999 is (n-1)*n/2
    const expectedSum = (count - 1) * count / 2.0;
    expect(resultFloats[0], equals(expectedSum));
  });

  test('Request cancellation', () async {
    const requestId = 'cancel_test';

    // Start a long running task
    final future = pool.compute('delay', 1000, requestId: requestId);

    // Cancel it almost immediately
    // Wait a tiny bit to ensure it might have reached the worker
    await Future.delayed(Duration(milliseconds: 50));
    pool.cancel(requestId);

    expect(future, throwsA(isA<OperationCanceledException>()));
  });

  test('Load balancing (multiple concurrent requests)', () async {
    final futures = <Future<Object?>>[];
    for (var i = 0; i < 4; i++) {
      futures.add(pool.compute('delay', 100));
    }

    final results = await Future.wait(futures);
    expect(results, everyElement(equals('done')));
  });

  test('Worker error handling', () async {
    expect(
      pool.compute('unknown', 'test'),
      throwsA(contains('Exception: Unknown method: unknown')),
    );
  });

  test('OperationCanceledException toString', () {
    final ex = OperationCanceledException('123');
    expect(ex.toString(), contains('Request 123 was canceled'));
  });

  test('Pool disposal error', () async {
    await pool.dispose();
    expect(() => pool.compute('echo', 'test'), throwsStateError);
  });

  test('Default worker count', () {
    final pool2 = IsolatePool();
    // Just verify it doesn't throw and sets a reasonable value
    // We can't easily verify the private _workerCount without reflection or exposure
    expect(pool2, isNotNull);
  });
}
