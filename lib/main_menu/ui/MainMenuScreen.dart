import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/level/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/utils/UiUtils.dart';
import 'package:provider/provider.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

class MainMenuScreen extends StatefulWidget {
  static const mainMenuheightSpacerKey1 = Key('mainMenuHeightSpacerKey1');
  static const mainMenuheightSpacerKey2 = Key('mainMenuHeightSpacerKey2');
  static const mainMenuheightSpacerKey3 = Key('mainMenuHeightSpacerKey3');
  static const mainMenuLogoKey = Key('mainMenuLogoKey');
  static const mainMenuButtonAboutKey = Key('mainMenuButtonAboutKey');
  static const mainMenuButtonPlayKey = Key('mainMenuButtonPlayKey');

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  late MainMenuViewModel vm;
  @override
  Widget build(BuildContext context) {
    UiUtils uiUtils = dependencyLocator<UiUtils>();

    vm = Provider.of<MainMenuViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            uiUtils.generateHeightSpacer(Dimensions().heightSpace,
                MainMenuScreen.mainMenuheightSpacerKey1),
            uiUtils.generateLogo(
                Dimensions().fractionalWidth, MainMenuScreen.mainMenuLogoKey),
            uiUtils.generateHeightSpacer(Dimensions().fractionalWidth,
                MainMenuScreen.mainMenuheightSpacerKey2),
            uiUtils.generateMenuButton(
                context,
                Dimensions().fractionalWidth,
                Dimensions().fractionalHeight,
                AppLocalizations.of(context).menuPlay,
                MainMenuScreen.mainMenuButtonPlayKey,
                LevelSelectionScreen()),
            uiUtils.generateHeightSpacer(Dimensions().heightSpace,
                MainMenuScreen.mainMenuheightSpacerKey3),
            uiUtils.generateMenuButton(
                context,
                Dimensions().fractionalWidth,
                Dimensions().fractionalHeight,
                AppLocalizations.of(context).menuAbout,
                MainMenuScreen.mainMenuButtonAboutKey,
                AboutScreen()),
          ],
        ),
      )),
    );
  }
}
