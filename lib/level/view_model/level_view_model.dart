import 'package:quiz_test/models/Level.dart';

class LevelViewModel {
  final Level level;

  LevelViewModel({required this.level});

  int get id {
    return this.level.id;
  }

  String get name {
    return this.level.name;
  }
}
