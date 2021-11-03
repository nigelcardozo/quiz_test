import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/main_menu/ui/MainMenuScreen.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:provider/provider.dart';

import 'level/view_model/LevelViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainMenuViewModel()),
        ChangeNotifierProvider(create: (context) => LevelSelectionViewModel()),
        ChangeNotifierProvider(create: (context) => LevelViewModel()),
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
