import 'package:quiz_test/models/Level.dart';

class LevelModel {
  final Level level;

  LevelModel({required this.level});

  int get id {
    return this.level.id;
  }

  String get name {
    return this.level.name;
  }
}
