import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import '../../models/Levels.dart';

class LevelSelectionViewModel extends ChangeNotifier {
  late LevelRepository levelRepository;

  // ToDo - Need to identify how to watch 'levels' instead.
  bool changed = false;
  List<Levels> levels = <Levels>[];

  void setRepository(LevelRepository levelRepository) {
    this.levelRepository = levelRepository;
  }

  Future<void> fetchLevels() async {
    final results = await levelRepository.fetchLevels();
    this.levels = results.map((item) => Levels(level: item)).toList();
    changed = true;
    notifyListeners();
  }

  // ToDo - These are hard coded for now... will change later.
  bool isLevelLocked(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= 3) return false;
    return true;
  }
}
