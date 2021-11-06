import 'package:quiz_test/models/Level.dart';

class LevelsModel {
  final Level level;

  LevelsModel({required this.level});

  int get id {
    return this.level.id;
  }

  String get name {
    return this.level.name;
  }
}
