import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/routes/FirstRoute.dart';
import 'package:quiz_test/routes/LevelSelectionScreen.dart';

typedef LevelSelectionScreenCallBack = LevelSelectionScreen Function();
typedef FirstRouteCallBack = FirstRoute Function();

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
            generateHeightSpacer(0.2),
            generateLogo(0.8),
            generateHeightSpacer(0.8),
            generateMenuButton(context, 0.8, 0.4,
                AppLocalizations.of(context)!.menuPlay, LevelSelectionScreen()),
            generateHeightSpacer(0.2),
            generateMenuButton(context, 0.8, 0.4,
                AppLocalizations.of(context)!.menuAbout, FirstRoute()),
          ],
        ),
      )),
    );
  }
}

Flexible generateHeightSpacer(double height) {
  return Flexible(
      child: FractionallySizedBox(
    heightFactor: height,
  ));
}

Flexible generateLogo(double width) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      child: Image(image: AssetImage('assets/images/quizlogo.png')),
    ),
  );
}

Flexible generateMenuButton(BuildContext context, double width, double height,
    String menuText, Widget widget) {
  return Flexible(
      child: FractionallySizedBox(
    widthFactor: width,
    heightFactor: height,
    child: ElevatedButton(
      child: Text(menuText),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    ),
  ));
}
