import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/routes/SecondRoute.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            // Logo Spacer
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.2,
            )),

            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Image(image: AssetImage('assets/images/quizlogo.png')),
              ),
            ),

            // Menu Button Spacer
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.8,
            )),

            Flexible(
                child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.4,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.menuPlay),
                onPressed: () {
                  print('Pressed');
                },
              ),
            )),

            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.2,
            )),

            Flexible(
                child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.4,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.menuAbout),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ))
          ],
        ),
      )),
    );
  }
}
