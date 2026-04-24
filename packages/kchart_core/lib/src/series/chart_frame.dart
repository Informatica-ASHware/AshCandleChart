import 'dart:convert';
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'annotation.dart';
import 'institutional_models.dart';
import 'series.dart';
import 'trade_overlay.dart';
import 'viewport.dart';

part 'chart_frame.freezed.dart';

/// Exception thrown when [ChartFrame] binary deserialization fails.
class ChartFrameDeserializationException implements Exception {
  /// Message describing the error.
  final String message;

  /// Creates a [ChartFrameDeserializationException].
  ChartFrameDeserializationException(this.message);

  @override
  String toString() => 'ChartFrameDeserializationException: $message';
}

/// Represents a complete snapshot of the chart state for a single frame.
///
/// This model is immutable and contains all the necessary data to render
/// the chart, including the main series, indicators, and the current viewport.
@freezed
class ChartFrame with _$ChartFrame {
  const ChartFrame._();

  /// Creates a [ChartFrame] with the given parameters.
  const factory ChartFrame({
    /// The main price [Series].
    required Series series,

    /// Map of indicator names to their respective [Series].
    required Map<String, Series> indicators,

    /// The current [Viewport] state.
    required Viewport viewport,

    /// The collection of annotations (drawings) in the chart.
    @Default(AnnotationDocument()) AnnotationDocument annotations,

    /// The collection of trade-related overlays.
    @Default(TradeOverlayDocument()) TradeOverlayDocument tradeOverlays,

    /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
    required List<dynamic> overlays,

    /// Optional volume profile data.
    VolumeProfile? volumeProfile,

    /// Optional order book data.
    OrderBook? orderBook,

    /// Optional list of liquidation areas for heatmap.
    @Default([]) List<LiquidationArea> liquidations,

    /// Sequential number to track frame updates and ensure consistent state.
    required int sequenceNumber,

    /// Granular sequence numbers per panel to optimize repaints.
    /// Key can be 'main', 'volume', or indicator IDs.
    required Map<String, int> panelSequenceNumbers,
  }) = _ChartFrame;

  /// Serializes the [ChartFrame] to a binary format.
  ///
  /// This is a simplified binary format for fuzzing/resilience testing.
  /// Real-world usage might use Protobuf or FlatBuffers.
  Uint8List toBinary() {
    final seriesBytes = series.toBinary();
    final viewportJson =
        jsonEncode({'s': viewport.startIdx, 'e': viewport.endIdx});
    final viewportBytes = utf8.encode(viewportJson);

    final totalBytes = 4 + seriesBytes.length + 4 + viewportBytes.length + 4;
    final bytes = Uint8List(totalBytes);
    final bd = ByteData.view(bytes.buffer);

    int offset = 0;
    bd.setUint32(offset, seriesBytes.length);
    offset += 4;
    bytes.setRange(offset, offset + seriesBytes.length, seriesBytes);
    offset += seriesBytes.length;

    bd.setUint32(offset, viewportBytes.length);
    offset += 4;
    bytes.setRange(offset, offset + viewportBytes.length, viewportBytes);
    offset += viewportBytes.length;

    bd.setInt32(offset, sequenceNumber);

    return bytes;
  }

  /// Reconstructs a [ChartFrame] from a binary format.
  factory ChartFrame.fromBinary(Uint8List bytes) {
    if (bytes.length < 12) {
      throw ChartFrameDeserializationException('Input too short');
    }
    final bd = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length);

    int offset = 0;
    final seriesLen = bd.getUint32(offset);
    offset += 4;
    if (offset + seriesLen > bytes.length) {
      throw ChartFrameDeserializationException('Series data out of bounds');
    }
    final series = Series.fromBinary(bytes.sublist(offset, offset + seriesLen));
    offset += seriesLen;

    if (offset + 4 > bytes.length) {
      throw ChartFrameDeserializationException('Missing viewport length');
    }
    final viewportLen = bd.getUint32(offset);
    offset += 4;
    if (offset + viewportLen > bytes.length) {
      throw ChartFrameDeserializationException('Viewport data out of bounds');
    }
    final viewportJson = utf8.decode(bytes.sublist(offset, offset + viewportLen));
    final viewportMap = jsonDecode(viewportJson) as Map<String, dynamic>;
    final viewport = Viewport(
      startIdx: viewportMap['s'] as int,
      endIdx: viewportMap['e'] as int,
      scale: 1.0,
      scrollX: 0.0,
    );
    offset += viewportLen;

    if (offset + 4 > bytes.length) {
      throw ChartFrameDeserializationException('Missing sequence number');
    }
    final seq = bd.getInt32(offset);

    return ChartFrame(
      series: series,
      indicators: {},
      viewport: viewport,
      overlays: [],
      sequenceNumber: seq,
      panelSequenceNumbers: {'main': seq},
    );
  }
}
