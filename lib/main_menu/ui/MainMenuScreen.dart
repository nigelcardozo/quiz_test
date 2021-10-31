import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/level/ui/LevelSelectionScreen.dart';
import 'package:quiz_test/main_menu/view_model/MainMenuViewModel.dart';
import 'package:quiz_test/utils/UiUtils.dart';
import 'package:provider/provider.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  late MainMenuViewModel vm;
  final Dimensions dimensions = Dimensions();

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MainMenuViewModel>(context);
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
