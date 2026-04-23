import 'dart:convert';
import 'dart:io';

/// Script to generate a deterministic 50k candles JSON fixture for performance testing.
void main() {
  final int count = 50000;
  final List<Map<String, dynamic>> candles = [];

  double lastClose = 100.0;
  int timestamp = 1700000000000;

  for (int i = 0; i < count; i++) {
    final double open = lastClose;
    final double change = (i % 10 - 5) * 0.1;
    final double close = open + change;
    final double high = (open > close ? open : close) + 0.2;
    final double low = (open < close ? open : close) - 0.2;
    final double volume = 100.0 + (i % 50);

    candles.add({
      'timestamp': timestamp,
      'open': open,
      'high': high,
      'low': low,
      'close': close,
      'volume': volume,
    });

    lastClose = close;
    timestamp += 60000;
  }

  final String jsonString = jsonEncode(candles);
  final directory = Directory('packages/kchart_flutter/test/fixtures');
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  File('packages/kchart_flutter/test/fixtures/candles_50k.json').writeAsStringSync(jsonString);
  print('Generated 50000 candles to packages/kchart_flutter/test/fixtures/candles_50k.json');
}
