import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            generateMenuButton(
                0.8, 0.4, AppLocalizations.of(context)!.menuPlay),
            generateHeightSpacer(0.2),
            generateMenuButton(
                0.8, 0.4, AppLocalizations.of(context)!.menuAbout),
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

Flexible generateMenuButton(double width, double height, String menuText) {
  return Flexible(
      child: FractionallySizedBox(
    widthFactor: width,
    heightFactor: height,
    child: ElevatedButton(
      child: Text(menuText),
      onPressed: () {
        print('Pressed');
      },
    ),
  ));
}
