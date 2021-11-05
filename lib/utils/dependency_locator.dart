import 'package:get_it/get_it.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/utils/UiUtils.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  //dependencyLocator.registerSingleton(() => UiUtils());
  dependencyLocator.registerFactory(() => UiUtils());
  dependencyLocator.registerFactory(() => Dimensions());
  dependencyLocator.registerFactory(() => MainMenuViewModel());
}
