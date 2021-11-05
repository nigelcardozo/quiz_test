import 'package:get_it/get_it.dart';
import 'package:quiz_test/utils/UiUtils.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  //dependencyLocator.registerSingleton(() => UiUtils());
  dependencyLocator.registerFactory(() => UiUtils());
}
