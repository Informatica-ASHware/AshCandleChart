import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_config.freezed.dart';

/// Configuration for chart image export.
@freezed
class ExportConfig with _$ExportConfig {
  /// Creates an [ExportConfig].
  const factory ExportConfig({
    /// The pixel ratio for the exported image. Defaults to 2.0.
    @Default(2.0) double pixelRatio,

    /// Optional watermark text to be displayed on the image.
    String? watermark,

    /// Whether the image background should be opaque. Defaults to true.
    @Default(true) bool opaque,

    /// The background color for the exported image.
    /// Only used if [opaque] is true. Defaults to [Colors.white].
    @Default(Colors.white) Color backgroundColor,
  }) = _ExportConfig;
}
