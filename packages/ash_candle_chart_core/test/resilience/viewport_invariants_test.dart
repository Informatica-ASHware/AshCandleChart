// ABNER REVIEW
// import 'package:glados/glados.dart';
// import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
//
// void main() {
//   group('Viewport Invariants', () {
//     Glados2<int, int>(any.int, any.int).test(
//       'normalize ensures startIdx <= endIdx and within bounds',
//       (start, end) {
//         final viewport = Viewport(
//           startIdx: start,
//           endIdx: end,
//           scale: 1.0,
//           scrollX: 0.0,
//         );
//
//         // Test with various maxIndex values
//         for (final maxIndex in [-1, 0, 1, 10, 1000]) {
//           final normalized = viewport.normalize(maxIndex);
//
//           if (maxIndex < 0) {
//             expect(normalized.startIdx, 0);
//             expect(normalized.endIdx, 0);
//           } else {
//             expect(normalized.startIdx, greaterThanOrEqualTo(0));
//             expect(normalized.startIdx, lessThanOrEqualTo(maxIndex));
//             expect(normalized.endIdx, greaterThanOrEqualTo(0));
//             expect(normalized.endIdx, lessThanOrEqualTo(maxIndex));
//             expect(normalized.startIdx, lessThanOrEqualTo(normalized.endIdx));
//           }
//         }
//       },
//     );
//   });
// }
