import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/level/ui/LevelScreen.dart';
import 'package:provider/provider.dart';

class LevelSelectionScreen extends StatefulWidget {
  @override
  _LevelSelectionScreenState createState() => _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends State<LevelSelectionScreen> {
  @override
  void initState() {
    super.initState();

    // Uncomment to get the full list at start up
    //Provider.of<LevelSelectionViewModel>(context, listen: false).fetchLevels();
  }

  late LevelSelectionViewModel vm;

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<LevelSelectionViewModel>(context);

    vm.fetchLevels();

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
        itemCount: vm.levels.length,
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
        if (vm.isLevelLocked(index + 1)) {
          return _generateLockedIcon(constraint);
        }
        return _generateUnlockedIcon(constraint);
      }),
      title: Text(
        vm.levels[index].name,
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
