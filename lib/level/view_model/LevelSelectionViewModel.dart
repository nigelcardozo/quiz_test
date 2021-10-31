import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'level_view_model.dart';

class LevelSelectionViewModel extends ChangeNotifier {
  List<LevelViewModel> levels = <LevelViewModel>[];

  Future<void> fetchLevels() async {
    final results = await LevelRepository().fetchLevels();
    this.levels = results.map((item) => LevelViewModel(level: item)).toList();
    print(this.levels);
    notifyListeners();
  }

  // ToDo - These are hard coded for now... will change later.
  bool isLevelLocked(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= 3) return false;
    return true;
  }
}
