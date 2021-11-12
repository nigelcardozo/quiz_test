import 'package:get_it/get_it.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'package:quiz_test/level/view_model/LevelHelper.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';
import 'package:quiz_test/main_menu/repository/main_menu_resource_provider.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/models/Answers.dart';
import 'package:quiz_test/utils/UiUtils.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  dependencyLocator.registerSingleton<UiUtils>(UiUtils());
  dependencyLocator
      .registerSingleton<MainMenuResourceProvider>(MainMenuResourceProvider());
  dependencyLocator.registerFactory(() => Dimensions());
  dependencyLocator.registerFactory(() => MainMenuViewModel());
  dependencyLocator.registerSingleton<LevelRepository>(LevelRepository());
  //dependencyLocator.registerFactory(() => LevelSelectionViewModel());
  dependencyLocator
      .registerSingleton<LevelSelectionViewModel>(LevelSelectionViewModel());
  dependencyLocator.registerSingleton<LevelHelper>(LevelHelper());
  dependencyLocator.registerFactoryAsync<List<Answers>>(
      () async => LevelViewModel().tempFetchAnswers());
}
