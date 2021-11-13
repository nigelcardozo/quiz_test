import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/models/Level.dart';
import 'package:test/test.dart';
import 'LevelSelectionViewModelTest.mocks.dart';

late LevelSelectionViewModel levelSelectionViewModel;

@GenerateMocks([LevelRepository])
void main() {
  setUp(() {
    levelSelectionViewModel = new LevelSelectionViewModel();
  });

  List<Level> _getLevelTestData() {
    List<Level> levelsList = <Level>[];

    Level level = Level(id: 1, name: "Level 1");
    levelsList.add(level);

    level = Level(id: 2, name: "Level 2");
    levelsList.add(level);

    level = Level(id: 3, name: "Level 3");
    levelsList.add(level);

    return levelsList;
  }

  test('Test isLevelLocked returns correct responses', () {
    bool response = levelSelectionViewModel.isLevelLocked(1);
    expect(response, false);

    response = levelSelectionViewModel.isLevelLocked(2);
    expect(response, false);

    response = levelSelectionViewModel.isLevelLocked(3);
    expect(response, false);

    response = levelSelectionViewModel.isLevelLocked(0);
    expect(response, true);

    response = levelSelectionViewModel.isLevelLocked(4);
    expect(response, true);
  });

  test('Test that LevelSelectionViewModel level is correctly set', () async {
    var mockLevelRepository = MockLevelRepository();
    List<Level> levelsList = _getLevelTestData();

    when(mockLevelRepository.fetchLevels())
        .thenAnswer((_) async => SynchronousFuture((levelsList)));

    levelSelectionViewModel.setRepository(mockLevelRepository);

    var result = await levelSelectionViewModel.fetchLevels();

    expect(result.length, 3);

    expect(result[0].id, 1);
    expect(result[0].name, "Level 1");

    expect(result[1].id, 2);
    expect(result[1].name, "Level 2");

    expect(result[2].id, 3);
    expect(result[2].name, "Level 3");
  });
}
