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
  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MainMenuViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            generateHeightSpacer(Dimensions().heightSpace),
            generateLogo(Dimensions().fractionalWidth),
            generateHeightSpacer(Dimensions().fractionalWidth),
            generateMenuButton(
                context,
                Dimensions().fractionalWidth,
                Dimensions().fractionalHeight,
                AppLocalizations.of(context)!.menuPlay,
                LevelSelectionScreen()),
            generateHeightSpacer(Dimensions().heightSpace),
            generateMenuButton(
                context,
                Dimensions().fractionalWidth,
                Dimensions().fractionalHeight,
                AppLocalizations.of(context)!.menuAbout,
                AboutScreen()),
          ],
        ),
      )),
    );
  }
}
