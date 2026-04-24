import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'export_config.dart';

/// Utility class for exporting chart images.
class ImageExporter {
  /// Exports the given [boundary] to a PNG image as [Uint8List].
  ///
  /// Applies [config] for pixel ratio, watermark, and background.
  static Future<Uint8List> export(
    RenderRepaintBoundary boundary,
    ExportConfig config,
  ) async {
    final ui.Image image = await boundary.toImage(pixelRatio: config.pixelRatio);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    final double width = image.width.toDouble();
    final double height = image.height.toDouble();

    if (config.opaque) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width, height),
        paint..color = config.backgroundColor,
      );
    }

    canvas.drawImage(image, Offset.zero, Paint());

    if (config.watermark != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: config.watermark,
          style: TextStyle(
            color: const Color(0x80808080), // Semi-transparent grey
            fontSize: 14 * config.pixelRatio,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Position watermark at bottom-right with some padding
      textPainter.paint(
        canvas,
        Offset(
          width - textPainter.width - 16 * config.pixelRatio,
          height - textPainter.height - 16 * config.pixelRatio,
        ),
      );
    }

    final picture = recorder.endRecording();
    final finalImage = await picture.toImage(image.width, image.height);
    final byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);

    // Clean up resources
    image.dispose();
    finalImage.dispose();

    if (byteData == null) {
      throw Exception('Failed to encode image to PNG');
    }

    return byteData.buffer.asUint8List();
  }
}
