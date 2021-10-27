import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnswerScreen extends StatelessWidget {
  final Image image;

  const AnswerScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('First Route'),
          title: Text(AppLocalizations.of(context)!.titleAboutQuiz)),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            generateHeightSpacer(0.2),
            generateImage(this.image),
            generateHeightSpacer(0.2),
            generateTextField(0.8),
          ],
        ),
      )
          // child: this.image
          ),
    );
  }
}

// THIS IS THE SAME AS THE ONE IN MAIN MENU
Flexible generateHeightSpacer(double height) {
  return Flexible(
      child: FractionallySizedBox(
    heightFactor: height,
  ));
}

Flexible generateImage(Image image) {
  return Flexible(
    child: FractionallySizedBox(
      // widthFactor: width,
      child: image,
    ),
  );
}

Flexible generateTextField(double width) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      child: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onSubmitted: (String str) {
            print('answer == ' + str.toLowerCase());
          }),
    ),
  );
}
