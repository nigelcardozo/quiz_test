import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/routes/SecondRoute.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text('First Route'),
            title: Text(AppLocalizations.of(context)!.firstRoute)),
        body: Column(
          children: <Widget>[
            Expanded(
              // child: FittedBox(
              //   fit: BoxFit.contain, // otherwise the logo will be tiny
              //   child: Image(image: AssetImage('assets/images/basiclogo.png')),
              // ),
              child: Image(image: AssetImage('assets/images/basiclogo.png')),
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.menuPlay),
              onPressed: () {
                print('Pressed');
              },
            ),
          ],
        ));
  }
}
