import 'package:quiz_test/models/Level.dart';
import 'package:quiz_test/models/Levels.dart';
import 'package:test/test.dart';

void main() {
  test('Test that correct id and name are returned', () {
    Level level = Level(id: 1, name: "Level One");
    Levels levels = Levels(level: level);

    expect(levels.id, 1);
    expect(levels.name, "Level One");
  });
}
