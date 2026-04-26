import 'package:freezed_annotation/freezed_annotation.dart';

part 'annotation.freezed.dart';
part 'annotation.g.dart';

/// Represents a point in the chart coordinates.
@freezed
abstract class AnnotationPoint with _$AnnotationPoint {
  /// Creates an [AnnotationPoint] with the given [timestamp] and [price].
  const factory AnnotationPoint({
    /// Unix timestamp in milliseconds.
    required int timestamp,

    /// Price value.
    required double price,
  }) = _AnnotationPoint;

  /// Creates an [AnnotationPoint] from a JSON object.
  factory AnnotationPoint.fromJson(Map<String, dynamic> json) =>
      _$AnnotationPointFromJson(json);
}

/// Base class for all drawing annotations.
///
/// Annotations are visual elements drawn on the chart that are anchored
/// to specific time and price coordinates.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
abstract class Annotation with _$Annotation {
  /// Base constructor for [Annotation].
  const Annotation._();

  /// A trend line defined by two points.
  const factory Annotation.trendLine({
    /// Unique identifier for the annotation.
    required String id,

    /// The starting point of the trend line.
    required AnnotationPoint start,

    /// The ending point of the trend line.
    required AnnotationPoint end,

    /// Hex color of the line.
    @Default(0xFF2196F3) int color,

    /// Width of the line.
    @Default(2.0) double strokeWidth,
  }) = TrendLine;

  /// Creates an [Annotation] from a JSON object.
  factory Annotation.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    if (type == 'trend_line') {
      return Annotation.trendLine(
        id: json['id'] as String,
        start: AnnotationPoint.fromJson(json['start'] as Map<String, dynamic>),
        end: AnnotationPoint.fromJson(json['end'] as Map<String, dynamic>),
        color: json['color'] as int? ?? 0xFF2196F3,
        strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 2.0,
      );
    }
    throw UnimplementedError('Unknown annotation type: $type');
  }

  /// Converts the annotation to a JSON object.
  Map<String, dynamic> toJson() {
    final self = this;
    if (self is TrendLine) {
      return {
        'type': 'trend_line',
        'id': self.id,
        'start': self.start.toJson(),
        'end': self.end.toJson(),
        'color': self.color,
        'strokeWidth': self.strokeWidth,
      };
    }
    throw UnimplementedError('Unknown annotation type');
  }
}

/// A document containing a collection of annotations.
@freezed
abstract class AnnotationDocument with _$AnnotationDocument {
  const AnnotationDocument._();

  /// Creates an [AnnotationDocument] with a list of [annotations].
  const factory AnnotationDocument({
    /// List of annotations in the document.
    @Default([]) List<Annotation> annotations,
  }) = _AnnotationDocument;

  /// Creates an [AnnotationDocument] from a JSON object.
  factory AnnotationDocument.fromJson(Map<String, dynamic> json) {
    return AnnotationDocument(
      annotations: (json['annotations'] as List<dynamic>?)
              ?.map((e) => Annotation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Converts the document to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'annotations': annotations.map((a) => a.toJson()).toList(),
    };
  }
}
