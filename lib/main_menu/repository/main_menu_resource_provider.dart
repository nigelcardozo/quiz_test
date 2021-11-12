import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainMenuResourceProvider {
  String getMenuPlayTitle(BuildContext context) {
    return AppLocalizations.of(context).menuPlay;
  }

  String getMenuAboutTitle(BuildContext context) {
    return AppLocalizations.of(context).menuAbout;
  }
}
