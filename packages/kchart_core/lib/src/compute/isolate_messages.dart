import 'dart:isolate';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../indicators/indicator.dart';
import '../series/series.dart';

part 'isolate_messages.freezed.dart';

/// Base class for messages sent to the isolate.
@freezed
class ComputeRequest with _$ComputeRequest {
  /// Creates a compute request.
  const factory ComputeRequest({
    /// Unique identifier for the request, used for correlation and cancellation.
    required String requestId,

    /// The method or operation to perform.
    required String method,

    /// The payload for the request.
    /// Should ideally contain [TransferableTypedData] for large data.
    required Object? payload,
  }) = _ComputeRequest;

  /// Request to calculate a batch of indicators.
  const factory ComputeRequest.indicatorBatch({
    required String requestId,
    required List<IndicatorConfig> configs,
    required Series series,
  }) = _IndicatorBatchRequest;
}

/// Base class for messages received from the isolate.
@freezed
class ComputeResponse with _$ComputeResponse {
  /// Creates a compute response.
  const factory ComputeResponse({
    /// Unique identifier correlated with the [ComputeRequest].
    required String requestId,

    /// The result of the computation.
    /// Should ideally contain [TransferableTypedData] for large data.
    Object? payload,

    /// Error message if the computation failed.
    String? error,
  }) = _ComputeResponse;
}

/// Internal message to control the isolate worker.
@freezed
class ControlMessage with _$ControlMessage {
  /// Sent to the worker to stop processing and exit.
  const factory ControlMessage.exit() = _Exit;

  /// Sent to the worker to cancel a specific request.
  const factory ControlMessage.cancel({required String requestId}) = _Cancel;
}
