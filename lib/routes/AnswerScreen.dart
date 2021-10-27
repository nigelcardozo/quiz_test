import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('First Route'),
          title: Text(AppLocalizations.of(context)!.titleAboutQuiz)),
      backgroundColor: Colors.white,
      body: SafeArea(
          child:
              Center(child: Text(AppLocalizations.of(context)!.aboutQuizText))),
    );
  }
}
