import 'package:flutter/material.dart';
import 'package:quiz_test/level/ui/level_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

void main() {
  setup();

  // ToDo
}

void setup() {
  setupDependencyLocator();
}

class LevelScreenWrapper extends StatelessWidget {
  LevelScreenWrapper();

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
      home: LevelScreen(),
    );
  }
}
