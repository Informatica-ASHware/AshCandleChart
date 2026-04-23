import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  test('check ref onCancel/onResume', () {
    final provider = Provider((ref) {
      ref.onCancel(() {});
      ref.onResume(() {});
    });
    final container = ProviderContainer();
    container.read(provider);
  });
}
