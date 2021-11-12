import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/level/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/main.dart';
import 'package:quiz_test/main_menu/ui/MainMenuScreen.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

void main() {
  setup();

  testWidgets("MainMenu Validate 6 Widgets", (WidgetTester tester) async {
    await tester.pumpWidget(MainMenuScreenWrapper());
    var textField = find.byType(Flexible);
    expect(textField, findsNWidgets(6));
  });

  testWidgets("MainMenu Validate Two Text Menu Buttons",
      (WidgetTester tester) async {
    await tester.pumpWidget(MainMenuScreenWrapper());
    var textField = find.byType(Text);
    expect(textField, findsNWidgets(2));
  });

  testWidgets("MainMenu Validate Play Button Exists",
      (WidgetTester tester) async {
    await tester.pumpWidget(MainMenuScreenWrapper());
    var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
    expect(button, findsOneWidget);
  });

  testWidgets("MainMenu Validate About Button Exists",
      (WidgetTester tester) async {
    await tester.pumpWidget(MainMenuScreenWrapper());
    var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
    expect(button, findsOneWidget);
  });

  testWidgets("MainMenu Validate About Screen Shown when About Button Pressed",
      (WidgetTester tester) async {
    await tester.pumpWidget(MainMenuScreenWrapper());
    var button = find.byKey(MainMenuScreen.mainMenuButtonAboutKey);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    var appBarTitle = find.byKey(AboutScreen.aboutAppBarTitleKey);
    expect(appBarTitle, findsOneWidget);
  });

  // ToDo - Fix this so we inject MainMenuScreenWrapper instead.
  testWidgets("MainMenu Validate Level Shown when Play Button Pressed",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
    expect(button, findsOneWidget);
    await tester.tap(button);

    // This is not nice but a current workaround due to the circular progress animation
    for (int i = 0; i < 5; i++) {
      await tester.pump(Duration(seconds: 1));
    }

    var appBarTitle =
        find.byKey(LevelSelectionScreen.levelSelectionAppBarTitleKey);
    expect(appBarTitle, findsOneWidget);
  });
}

void setup() {
  setupDependencyLocator();
}

class MainMenuScreenWrapper extends StatelessWidget {
  MainMenuScreenWrapper();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: MainMenuScreen(),
    // );
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      home: MainMenuScreen(),
    );
  }
}
