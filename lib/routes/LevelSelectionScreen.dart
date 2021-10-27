import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/routes/LevelScreen.dart';

class LevelSelectionScreen extends StatelessWidget {
  final int minLevelNumber = 1;
  final int maxLevelNumber = 20;

  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> levelList = generateLevelList(
        AppLocalizations.of(context)!.menuLevel,
        minLevelNumber,
        maxLevelNumber);

    return Scaffold(
      appBar: AppBar(
          //title: Text('First Route'),
          title: Text(AppLocalizations.of(context)!.titleSelectLevel)),
      backgroundColor: Colors.white,
      body: SafeArea(child: generateListView(LevelScreen(), levelList)),
    );
  }
}

List<String> generateLevelList(String menuTitle, int minLevel, int maxLevel) {
  List<String> levelList = <String>[];

  for (int i = 1; i < 15; i++) {
    levelList.add(menuTitle + " " + i.toString());
  }

  return levelList;
}

ListView generateListView(Widget widget, List<String> entries) {
  return ListView.builder(
      padding: const EdgeInsets.all(40),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return generateCard(context, widget, entries, index, Colors.lightGreen);
      });
}

Card generateCard(BuildContext context, Widget widget, List<String> entries,
    int index, MaterialColor requestedColor) {
  return Card(
      color: requestedColor,
      child: generateListTile(context, widget, entries, index));
}

ListTile generateListTile(
    BuildContext context, Widget widget, List<String> entries, int index) {
  return ListTile(
    leading: LayoutBuilder(builder: (context, constraint) {
      if (isLevelLocked(index + 1)) {
        return generateLockedIcon(constraint);
      }
      return generateUnlockedIcon(constraint);
    }),
    title: Text(
      entries[index],
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
        MaterialPageRoute(builder: (context) => widget),
      );
    },
  );
}

// FOR NOW ALL LEVELS BUT THE FIRST ARE MARKED AS LOCKED
bool isLevelLocked(int levelNumber) {
  if (levelNumber >= 1 && levelNumber <= 3) return false;
  return true;
}

Icon generateLockedIcon(BoxConstraints constraint) {
  return new Icon(Icons.lock, size: constraint.biggest.height);
}

Icon generateUnlockedIcon(BoxConstraints constraint) {
  return new Icon(Icons.lock_open, size: constraint.biggest.height);
}
