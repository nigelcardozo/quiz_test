import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      AppLocalizations.of(context)!.menuLevel + " 1",
      AppLocalizations.of(context)!.menuLevel + " 2",
      AppLocalizations.of(context)!.menuLevel + " 3",
      AppLocalizations.of(context)!.menuLevel + " 4",
      AppLocalizations.of(context)!.menuLevel + " 5",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(40),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.lightGreen,
                child: ListTile(
                  leading: LayoutBuilder(builder: (context, constraint) {
                    return new Icon(Icons.access_alarms,
                        size: constraint.biggest.height);
                  }),
                  // leading: Icon(Icons.account_circle),
                  title: Text(
                    entries[index],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle:
                      Text('0 / 15', style: TextStyle(color: Colors.white70)),
                  onTap: () {
                    print('Pressed $index');
                  },
                ),
              );
            }),

        // child: ListView(
        //   children: [
        //     Ink(
        //       color: Colors.lightGreen,
        //       child: ListTile(
        //         title: Text('With lightGreen background'),
        //         onTap: () {
        //           print('Pressed');
        //         },
        //       ),
        //     ),
        //   ],
        // ),

        // child: ListView.builder(
        //     padding: const EdgeInsets.all(40),
        //     itemCount: entries.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Card(
        //         child: ListTile(
        //           tileColor: Colors.green,
        //           focusColor: Colors.greenAccent,
        //           hoverColor: Colors.blue,
        //           selectedTileColor: Colors.deepPurple,
        //           title: Center(child: Text(entries[index])),
        //           onTap: () {
        //             print('Pressed');
        //             //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FruitDetail(fruitDataModel: Fruitdata[index],)));
        //           },
        //         ),
        //       );
        //     }),
      ),
    );
  }
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
