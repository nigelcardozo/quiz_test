import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/level/ui/LevelScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/main.dart';
import 'package:quiz_test/main_menu/ui/MainMenuScreen.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

void main() {
  setup();

  // testWidgets(
  //   'Level Selection Screen shows spinner whilst loading',
  //   (WidgetTester tester) async {
  //     when(valueRepository.getValues())
  //         .thenAnswer((_) => Future.delayed(Duration(seconds: 1), () => []));
  //     await tester.pumpWidget(withApp(ValueListPage(
  //       valueRepository: valueRepository,
  //     )));
  //
  //     await tester.pump();
  //
  //     expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //     await tester.pumpAndSettle();
  //     expect(find.byType(CircularProgressIndicator), findsNothing);
  //   },
  // );

  // testWidgets('This test should pass but fails', (tester) async {
  //   await tester.runAsync(() async {
  //     final future = Future<void>.error(42);
  //
  //     await tester.pumpWidget(FutureBuilder(
  //       future: future,
  //       builder: (_, snapshot) {
  //         return Container();
  //       },
  //     ));
  //   });
  // });

  // testWidgets('MainMenu Validate App Bar Title is correct',
  //     (WidgetTester tester) async {
  //   await tester.runAsync(() async {
  //     await tester.pumpWidget(LevelScreenWrapper());
  //
  //     for (int i = 0; i < 5; i++) {
  //       await tester.pump(Duration(seconds: 1));
  //     }
  //
  //     var appBarTitle = find.byKey(LevelScreen.levelScreenAppBarTitleKey);
  //     expect(appBarTitle, findsOneWidget);
  //   });
  // });
  // testWidgets("MainMenu Validate App Bar Title is correct",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(LevelScreenWrapper());
  //   var appBarTitle = find.byKey(LevelScreen.levelScreenAppBarTitleKey);
  //   expect(appBarTitle, findsOneWidget);
  // });

  // testWidgets("MainMenu Validate 6 Widgets", (WidgetTester tester) async {
  //   await tester.pumpWidget(MainMenuScreenWrapper());
  //   var textField = find.byType(Flexible);
  //   expect(textField, findsNWidgets(6));
  // });

  //
  // testWidgets("MainMenu Validate Two Text Menu Buttons",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var textField = find.byType(Text);
  //   expect(textField, findsNWidgets(2));
  // });
  //
  // testWidgets("MainMenu Validate Play Button Exists",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
  //   expect(button, findsOneWidget);
  // });
  //
  // testWidgets("MainMenu Validate About Button Exists",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
  //   expect(button, findsOneWidget);
  // });
  //
  // testWidgets("MainMenu Validate About Screen Shown when About Button Pressed",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.byKey(MainMenuScreen.mainMenuButtonAboutKey);
  //   expect(button, findsOneWidget);
  //   await tester.tap(button);
  //   await tester.pumpAndSettle();
  //   var appBarTitle = find.byKey(AboutScreen.aboutAppBarTitleKey);
  //   expect(appBarTitle, findsOneWidget);
  // });
  //
  // testWidgets("MainMenu Validate Level Shown when Play Button Pressed",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.byKey(MainMenuScreen.mainMenuButtonPlayKey);
  //   expect(button, findsOneWidget);
  //   await tester.tap(button);
  //   await tester.pumpAndSettle();
  //   var appBarTitle =
  //       find.byKey(LevelSelectionScreen.levelSelectionAppBarTitleKey);
  //   expect(appBarTitle, findsOneWidget);
  // });
}

void setup() {
  setupDependencyLocator();
}

class LevelScreenWrapper extends StatelessWidget {
  LevelScreenWrapper();

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
      home: LevelScreen(),
    );
  }
}
