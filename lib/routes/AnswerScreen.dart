import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnswerScreen extends StatelessWidget {
  final Image image;
  final String answer;

  const AnswerScreen({Key? key, required this.image, required this.answer})
      : super(key: key);

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
            generateTextField(0.8, this.answer, context),
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
            print('answer == ' + str.toLowerCase());

            if (str.trim().toLowerCase().contains(answer)) {
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
            } else {
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
          }),
    ),
  );
}
