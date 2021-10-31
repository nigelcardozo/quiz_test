import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/model/LevelViewModel.dart';
import 'package:quiz_test/level/repository/LevelRepository.dart';
import 'package:quiz_test/level/ui/LevelScreen.dart';
import 'package:quiz_test/models/Level.dart';

class LevelSelectionScreen extends StatelessWidget {
  // TODo - change this
  LevelViewModel levelViewModel = LevelViewModel();
  List<Level> levelList = [];

  LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    levelList = LevelRepository().generateLevelList();

    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.titleSelectLevel)),
      backgroundColor: Colors.white,
      body: SafeArea(child: _generateListView()),
    );
  }

  ListView _generateListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(40),
        itemCount: levelList.length,
        itemBuilder: (BuildContext context, int index) {
          return _generateCard(context, index, Colors.lightGreen);
        });
  }

  Card _generateCard(
      BuildContext context, int index, MaterialColor requestedColor) {
    return Card(
        color: requestedColor, child: _generateListTile(context, index));
  }

  ListTile _generateListTile(BuildContext context, int index) {
    return ListTile(
      leading: LayoutBuilder(builder: (context, constraint) {
        if (levelViewModel.isLevelLocked(index + 1)) {
          return _generateLockedIcon(constraint);
        }
        return _generateUnlockedIcon(constraint);
      }),
      title: Text(
        levelList[index].name,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text('0 / 15', style: TextStyle(color: Colors.white70)),
      onTap: () {
        print('Pressed $index');

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LevelScreen(level: (index + 1))),
        );
      },
    );
  }

  Icon _generateLockedIcon(BoxConstraints constraint) {
    return new Icon(Icons.lock, size: constraint.biggest.height);
  }

  Icon _generateUnlockedIcon(BoxConstraints constraint) {
    return new Icon(Icons.lock_open, size: constraint.biggest.height);
  }
}
