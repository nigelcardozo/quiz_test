import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_test/main.dart';
import 'package:quiz_test/main_menu/ui/MainMenuScreen.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

void main() {
  setupDependencyLocator();
  var mainMenuViewModel = dependencyLocator<MainMenuViewModel>();

  // testWidgets("Flutter Main Menu Test Menu Button About",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
  //
  //   expect(button, findsOneWidget);
  //   verify(mainMenuViewModel.multiply(2, 5));
  // });
}
