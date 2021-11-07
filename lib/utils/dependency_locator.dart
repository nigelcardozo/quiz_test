import 'package:get_it/get_it.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/level/view_model/LevelHelper.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/models/Answers.dart';
import 'package:quiz_test/utils/UiUtils.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  dependencyLocator.registerSingleton<UiUtils>(UiUtils());
  dependencyLocator.registerFactory(() => Dimensions());
  dependencyLocator.registerFactory(() => MainMenuViewModel());
  dependencyLocator.registerSingleton<LevelHelper>(LevelHelper());
  dependencyLocator.registerFactoryAsync<List<Answers>>(
      () async => LevelViewModel().tempFetchAnswers());
}