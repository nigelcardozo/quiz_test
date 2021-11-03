import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/constants/dimensions/Dimensions.dart';
import 'package:quiz_test/utils/UiUtils.dart';

class AnswerScreen extends StatelessWidget {
  final String imagePath;
  final String answer;

  const AnswerScreen({Key? key, required this.imagePath, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.titleAboutQuiz)),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              generateHeightSpacer(Dimensions().heightSpace),
              generateImage(Image(image: AssetImage(this.imagePath))),
              generateHeightSpacer(Dimensions().heightSpace),
              generateTextField(
                  Dimensions().fractionalWidth, this.answer, context),
            ],
          ),
        ),
        // child: this.image
      ),
    );
  }
}

Flexible generateTextField(double width, String answer, BuildContext context) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      child: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onSubmitted: (String str) {
            if (str.trim().toLowerCase().contains(answer)) {
              handleCorrectDialog(context);
            } else {
              handleIncorrectDialog(context);
            }
          }),
    ),
  );
}

// THESE SHOULD MOVE TO VIEW MODEL
void handleCorrectDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('CORRECT'),
            content: const Text('Answer was correct'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ));
}

void handleIncorrectDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('INCORRECT'),
            content: const Text('Answer was incorrect'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ));
}
