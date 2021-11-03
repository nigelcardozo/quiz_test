import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quiz_test/answer/ui/AnswerScreen.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';

class LevelScreen extends StatefulWidget {
  final int level;

  LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final int axisCountSize = 3;
  late LevelViewModel vm;

  @override
  void initState() {
    super.initState();

    // Uncomment to get the full list at start up
    //Provider.of<LevelSelectionViewModel>(context, listen: false).fetchLevels();
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<LevelViewModel>(context);

    vm.fetchAnswers(widget.level);

    return Scaffold(
      appBar: AppBar(title: Text(_getTitle(context, widget.level))),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _generateGridView(axisCountSize),
      ),
    );
  }

  String _getTitle(BuildContext context, int level) {
    return AppLocalizations.of(context).titleLevel + " " + level.toString();
  }

  GridView _generateGridView(int axisCountSize) {
    print(vm.answers.length);

    return GridView.builder(
        itemCount: vm.answers.length,
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
        child: Image(image: AssetImage(vm.answers[index].imagePath)),
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
              imagePath: vm.answers[index].imagePath,
              answer: vm.answers[index].solution)),
    );
  }
}
