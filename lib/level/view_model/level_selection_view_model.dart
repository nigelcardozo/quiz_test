import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/level_repository.dart';
import '../../models/levels.dart';

class LevelSelectionViewModel extends ChangeNotifier {
  late LevelRepository levelRepository;
  List<Levels> levels = <Levels>[];

  void setRepository(LevelRepository levelRepository) {
    this.levelRepository = levelRepository;
  }

  Future<List<Levels>> fetchLevels() async {
    final results = await levelRepository.fetchLevels();
    return results.map((item) => Levels(level: item)).toList();
  }

  // ToDo - These are hard coded for now... should be dynamic when required.
  bool isLevelLocked(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= 3) return false;
    return true;
  }
}
