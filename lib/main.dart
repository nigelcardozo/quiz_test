import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/view_model/level_selection_view_model.dart';
import 'package:quiz_test/main_menu/ui/main_menu_screen.dart';
import 'package:quiz_test/main_menu/view_model/main_menu_view_model.dart';
import 'package:provider/provider.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

void main() {
  setupDependencyLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainMenuViewModel()),
        ChangeNotifierProvider(create: (context) => LevelSelectionViewModel()),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) {
          return AppLocalizations.of(context).appTitle;
        },
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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => MainMenuViewModel(),
          child: MainMenuScreen(),
          // ),
        ),
      ),
    );
  }
}
