import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  test('check StreamProvider.autoPause existence', () {
     try {
       print(StreamProvider.autoPause);
     } catch (e) {
       print('autoPause not found on StreamProvider');
     }
  });
}
