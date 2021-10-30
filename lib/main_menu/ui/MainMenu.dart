import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/level_selection/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/utils/UiUtils.dart';

class MainMenu extends StatelessWidget {
  final double heightSpace = 0.2;
  final double fractionalWidth = 0.8;
  final double fractionalHeight = 0.4;

  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiUtils uiUtils = UiUtils();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            uiUtils.generateHeightSpacer(heightSpace),
            uiUtils.generateLogo(fractionalWidth),
            uiUtils.generateHeightSpacer(fractionalWidth),
            uiUtils.generateMenuButton(
                context,
                fractionalWidth,
                fractionalHeight,
                AppLocalizations.of(context)!.menuPlay,
                LevelSelectionScreen()),
            uiUtils.generateHeightSpacer(heightSpace),
            uiUtils.generateMenuButton(
                context,
                fractionalWidth,
                fractionalHeight,
                AppLocalizations.of(context)!.menuAbout,
                AboutScreen()),
          ],
        ),
      )),
    );
  }
}
