import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: SafeArea(child: generateListView(levelList)),
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

ListView generateListView(List<String> entries) {
  return ListView.builder(
      padding: const EdgeInsets.all(40),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return generateCard(entries, index, Colors.lightGreen);
      });
}

Card generateCard(
    List<String> entries, int index, MaterialColor requestedColor) {
  return Card(color: requestedColor, child: generateListTile(entries, index));
}

ListTile generateListTile(List<String> entries, int index) {
  return ListTile(
    leading: LayoutBuilder(builder: (context, constraint) {
      return new Icon(Icons.access_alarms, size: constraint.biggest.height);
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
    },
  );
}

Flexible generateHeightSpacer(double height) {
  return Flexible(
      child: FractionallySizedBox(
    heightFactor: height,
  ));
}

Flexible generateLogo(double width) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      child: Image(image: AssetImage('assets/images/quizlogo.png')),
    ),
  );
}

Flexible generateMenuButton(double width, double height, String menuText) {
  return Flexible(
      child: FractionallySizedBox(
    widthFactor: width,
    heightFactor: height,
    child: ElevatedButton(
      child: Text(menuText),
      onPressed: () {
        print('Pressed');
      },
    ),
  ));
}
