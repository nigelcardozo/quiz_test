import 'package:quiz_test/models/level.dart';
import 'package:test/test.dart';

void main() {
  test('Test that correct id and name are returned', () {
    Level level = Level(id: 1, name: "Level One");

    expect(level.id, 1);
    expect(level.name, "Level One");
  });
}
