import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/level_selection/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/utils/UiUtils.dart';

class MainMenu extends StatelessWidget {
  // NEED TO INJECT THIS LATER
  final Dimensions dimensions = Dimensions();

  MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiUtils uiUtils = UiUtils();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            uiUtils.generateHeightSpacer(dimensions.heightSpace),
            uiUtils.generateLogo(dimensions.fractionalWidth),
            uiUtils.generateHeightSpacer(dimensions.fractionalWidth),
            uiUtils.generateMenuButton(
                context,
                dimensions.fractionalWidth,
                dimensions.fractionalHeight,
                AppLocalizations.of(context)!.menuPlay,
                LevelSelectionScreen()),
            uiUtils.generateHeightSpacer(dimensions.heightSpace),
            uiUtils.generateMenuButton(
                context,
                dimensions.fractionalWidth,
                dimensions.fractionalHeight,
                AppLocalizations.of(context)!.menuAbout,
                AboutScreen()),
          ],
        ),
      )),
    );
  }
}
