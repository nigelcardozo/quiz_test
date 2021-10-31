import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'package:quiz_test/models/Level.dart';

class LevelViewModel {
  List<Level> generateLevels() {
    return LevelRepository().generateLevelList();
  }

  // ToDo - These are hard coded for now... will change later.
  bool isLevelLocked(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= 3) return false;
    return true;
  }
}
