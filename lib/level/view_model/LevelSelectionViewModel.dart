import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'LevelModel.dart';

class LevelSelectionViewModel extends ChangeNotifier {
  List<LevelModel> levels = <LevelModel>[];

  Future<void> fetchLevels() async {
    final results = await LevelRepository().fetchLevels();
    this.levels = results.map((item) => LevelModel(level: item)).toList();
    notifyListeners();
  }

  // ToDo - These are hard coded for now... will change later.
  bool isLevelLocked(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= 3) return false;
    return true;
  }
}
