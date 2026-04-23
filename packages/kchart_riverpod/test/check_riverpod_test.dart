import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  test('check autoPause', () {
    final provider = Provider((ref) {
      try {
        print((ref as dynamic).autoPause);
      } catch (e) {
        print('autoPause not in ref');
      }
    });
    final container = ProviderContainer();
    container.read(provider);
  });
}
