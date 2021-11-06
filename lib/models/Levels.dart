import 'package:quiz_test/models/Level.dart';

class Levels {
  final Level level;

  Levels({required this.level});

  int get id {
    return this.level.id;
  }

  String get name {
    return this.level.name;
  }
}
