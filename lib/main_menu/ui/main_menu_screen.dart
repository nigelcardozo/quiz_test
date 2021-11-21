import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/about_screen.dart';
import 'package:quiz_test/constants/dimensions/dimensions.dart';
import 'package:quiz_test/level/ui/level_selection_screen.dart';
import 'package:quiz_test/main_menu/repository/main_menu_resource_provider.dart';
import 'package:quiz_test/utils/ui_utils.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

class MainMenuScreen extends StatefulWidget {
  static const mainMenuHeightSpacerKey1 = Key('mainMenuHeightSpacerKey1');
  static const mainMenuHeightSpacerKey2 = Key('mainMenuHeightSpacerKey2');
  static const mainMenuHeightSpacerKey3 = Key('mainMenuHeightSpacerKey3');
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

  @override
  Widget build(BuildContext context) {
    var uiUtils = dependencyLocator<UiUtils>();
    var dimensions = dependencyLocator<Dimensions>();
    var mainMenuResourceProvider =
        dependencyLocator<MainMenuResourceProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            uiUtils.generateHeightSpacer(dimensions.heightSpace,
                MainMenuScreen.mainMenuHeightSpacerKey1),
            uiUtils.generateLogo(
                dimensions.fractionalWidth, MainMenuScreen.mainMenuLogoKey),
            uiUtils.generateHeightSpacer(dimensions.fractionalWidth,
                MainMenuScreen.mainMenuHeightSpacerKey2),
            uiUtils.generateMenuButton(
                context,
                dimensions.fractionalWidth,
                dimensions.fractionalHeight,
                mainMenuResourceProvider.getMenuPlayTitle(context),
                MainMenuScreen.mainMenuButtonPlayKey,
                LevelSelectionScreen()),
            uiUtils.generateHeightSpacer(dimensions.heightSpace,
                MainMenuScreen.mainMenuHeightSpacerKey3),
            uiUtils.generateMenuButton(
                context,
                dimensions.fractionalWidth,
                dimensions.fractionalHeight,
                mainMenuResourceProvider.getMenuAboutTitle(context),
                MainMenuScreen.mainMenuButtonAboutKey,
                AboutScreen()),
          ],
        ),
      )),
    );
  }
}
