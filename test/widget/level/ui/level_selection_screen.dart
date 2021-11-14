import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/models/Level.dart';
import 'package:quiz_test/models/Levels.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

import 'level_selection_screen.mocks.dart';

@GenerateMocks([LevelSelectionViewModel])
void main() {
  setup();

  List<Levels> _getLevelsTestData() {
    List<Levels> levelsList = <Levels>[];

    Level level = Level(id: 1, name: "Level 1");
    Levels levels = Levels(level: level);
    levelsList.add(levels);

    level = Level(id: 2, name: "Level 2");
    levels = Levels(level: level);
    levelsList.add(levels);

    level = Level(id: 3, name: "Level 3");
    levels = Levels(level: level);
    levelsList.add(levels);

    return levelsList;
  }

  testWidgets("Test App Bar is Shown after Mocked Level Data is returned",
      (WidgetTester tester) async {
    var mockLevelSelectionViewModel = MockLevelSelectionViewModel();
    List<Levels> levelsList = _getLevelsTestData();

    when(mockLevelSelectionViewModel.fetchLevels())
        .thenAnswer((_) async => SynchronousFuture((levelsList)));

    await tester.pumpWidget(LevelSelectionScreenWrapper());

    // This is not nice but a current workaround due to the circular progress animation
    for (int i = 0; i < 5; i++) {
      await tester.pump(Duration(seconds: 1));
    }

    var appBarTitleKey =
        find.byKey(LevelSelectionScreen.levelSelectionAppBarTitleKey);
    expect(appBarTitleKey, findsOneWidget);
  });
}

void setup() {
  setupDependencyLocator();
}

class LevelSelectionScreenWrapper extends StatelessWidget {
  LevelSelectionScreenWrapper();

  @override
  Widget build(BuildContext context) {
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
      home: LevelSelectionScreen(),
    );
  }
}
