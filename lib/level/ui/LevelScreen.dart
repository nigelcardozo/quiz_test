import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/answer/ui/AnswerScreen.dart';
import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:quiz_test/level/view_model/LevelHelper.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';
import 'package:quiz_test/models/Answers.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

LevelViewModel levelViewModel = dependencyLocator<LevelViewModel>();
AnswerRepository answerRepository = dependencyLocator<AnswerRepository>();

class LevelScreen extends StatefulWidget {
  static const levelScreenAppBarTitleKey = Key('levelScreenAppBarTitleKey');

  LevelScreen({Key? key}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final int axisCountSize = 3;
  List<Answers>? answers;
  LevelHelper levelHelper = dependencyLocator<LevelHelper>();

  @override
  void initState() {
    super.initState();
    _setLevelViewModelAnswerRepository();
    _setLevel();
  }

  void _setLevelViewModelAnswerRepository() {
    levelViewModel.setRepository(answerRepository);
  }

  void _setLevel() {
    levelViewModel.setLevel(levelHelper.level);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _getAnswers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                key: LevelScreen.levelScreenAppBarTitleKey,
                title: Text(
                  _getTitle(context, levelHelper.level),
                ),
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: _generateGridView(axisCountSize),
              ),
            );
          } else {
            // Temporary - Improve this
            return new Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Future<bool> _getAnswers() => Future(() async {
        answers = await levelViewModel.fetchAnswers();
        return true;
      });

  String _getTitle(BuildContext context, int level) {
    return AppLocalizations.of(context).titleLevel + " " + level.toString();
  }

  GridView _generateGridView(int axisCountSize) {
    return GridView.builder(
        itemCount: answers?.length,
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
        child: Image(image: AssetImage(answers![index].imagePath)),
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
              imagePath: answers![index].imagePath,
              answer: answers![index].solution)),
    );
  }
}
