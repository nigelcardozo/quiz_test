import 'package:quiz_test/utils/UiUtils.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    int response = addition(5, 2);

    expect(response, 7);
  });
}
