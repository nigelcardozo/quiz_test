import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/models/Level.dart';
import 'package:test/test.dart';

import 'LevelSelectionViewModel.mocks.dart';

@GenerateMocks([LevelRepository])
void main() {
  test('Test isLevelLocked returns correct response', () {
    bool response = LevelSelectionViewModel().isLevelLocked(1);
    expect(response, false);

    response = LevelSelectionViewModel().isLevelLocked(2);
    expect(response, false);

    response = LevelSelectionViewModel().isLevelLocked(3);
    expect(response, false);

    response = LevelSelectionViewModel().isLevelLocked(0);
    expect(response, true);

    response = LevelSelectionViewModel().isLevelLocked(4);
    expect(response, true);
  });

  test('Test that LevelSelectionViewModel level is correctly set', () async {
    var mockLevelRepository = MockLevelRepository();

    List<Level> levelsList = <Level>[];

    Level level = Level(id: 1, name: "Level 1");
    levelsList.add(level);

    level = Level(id: 2, name: "Level 2");
    levelsList.add(level);

    level = Level(id: 3, name: "Level 3");
    levelsList.add(level);

    when(mockLevelRepository.fetchLevels())
        .thenAnswer((_) async => SynchronousFuture((levelsList)));

    LevelSelectionViewModel levelSelectionViewModel =
        new LevelSelectionViewModel();
    levelSelectionViewModel.setRepository(mockLevelRepository);

    await levelSelectionViewModel.fetchLevels();

    expect(levelSelectionViewModel.levels.length, 3);
  });
}
