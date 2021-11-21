import 'package:get_it/get_it.dart';
import 'package:quiz_test/constants/dimensions/dimensions.dart';
import 'package:quiz_test/level/repository/answers_repository.dart';
import 'package:quiz_test/level/repository/level_repository.dart';
import 'package:quiz_test/level/view_model/level_helper.dart';
import 'package:quiz_test/level/view_model/level_selection_view_model.dart';
import 'package:quiz_test/level/view_model/level_view_model.dart';
import 'package:quiz_test/main_menu/repository/main_menu_resource_provider.dart';
import 'package:quiz_test/main_menu/view_model/main_menu_view_model.dart';
import 'package:quiz_test/models/answers.dart';
import 'package:quiz_test/utils/ui_utils.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  dependencyLocator.registerSingleton<UiUtils>(UiUtils());
  dependencyLocator
      .registerSingleton<MainMenuResourceProvider>(MainMenuResourceProvider());
  dependencyLocator.registerFactory(() => Dimensions());
  dependencyLocator.registerFactory(() => MainMenuViewModel());
  dependencyLocator.registerSingleton<AnswerRepository>(AnswerRepository());
  dependencyLocator.registerSingleton<LevelRepository>(LevelRepository());
  //dependencyLocator.registerFactory(() => LevelSelectionViewModel());
  dependencyLocator.registerSingleton<LevelViewModel>(LevelViewModel());
  dependencyLocator
      .registerSingleton<LevelSelectionViewModel>(LevelSelectionViewModel());
  dependencyLocator.registerSingleton<LevelHelper>(LevelHelper());
  dependencyLocator.registerFactoryAsync<List<Answers>>(
      () async => LevelViewModel().fetchAnswers());
}
