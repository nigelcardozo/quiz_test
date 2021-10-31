import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/answer/ui/AnswerScreen.dart';
import 'package:quiz_test/answers/repository/AnswersRepository.dart';
import 'package:quiz_test/models/Answer.dart';

class LevelScreen extends StatefulWidget {
  final int level;

  LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  List<Answer> answerList = [];
  final int axisCountSize = 3;

  @override
  Widget build(BuildContext context) {
    answerList = AnswersRepository().generateAnswerList(widget.level);

    return Scaffold(
      appBar: AppBar(title: Text(_getTitle(context, widget.level))),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _generateGridView(axisCountSize),
      ),
    );
  }

  String _getTitle(BuildContext context, int level) {
    return AppLocalizations.of(context)!.titleLevel + " " + level.toString();
  }

  GridView _generateGridView(int axisCountSize) {
    return GridView.builder(
        itemCount: answerList.length,
        gridDelegate: _generateSliverGrid(axisCountSize),
        itemBuilder: (BuildContext context, int index) {
          return _generateImageCard(context, index);
        });
  }

  SliverGridDelegateWithFixedCrossAxisCount _generateSliverGrid(int axisCount) {
    return SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount);
  }

  Card _generateImageCard(BuildContext context, int index) {
    return Card(
      child: new InkResponse(
        child: Image(image: AssetImage(answerList[index].imagePath)),
        onTap: () {
          _launchAnswerScreen(context, index);
        },
      ),
    );
  }

  void _launchAnswerScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AnswerScreen(
              imagePath: answerList[index].imagePath,
              answer: answerList[index].answer)),
    );
  }
}
