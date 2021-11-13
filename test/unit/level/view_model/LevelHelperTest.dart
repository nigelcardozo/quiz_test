import 'package:quiz_test/level/view_model/LevelHelper.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';
import 'package:test/test.dart';

late LevelViewModel levelViewModel;

void main() {
  test('Test that LevelHelper level is correctly set', () {
    LevelHelper levelHelper = LevelHelper();
    expect(levelHelper.getLevel(), 1);

    levelHelper.level = 2;
    expect(levelHelper.getLevel(), 2);
  });
}
