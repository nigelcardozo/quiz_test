import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz_test/level/view_model/LevelHelper.dart';
import 'package:quiz_test/level/view_model/LevelSelectionViewModel.dart';
import 'package:quiz_test/level/ui/LevelScreen.dart';
import 'package:provider/provider.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

LevelSelectionViewModel levelSelectionViewModel =
    dependencyLocator<LevelSelectionViewModel>();
LevelHelper levelHelper = dependencyLocator<LevelHelper>();

class LevelSelectionScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {
  static const levelSelectionAppBarTitleKey =
      Key('levelSelectionAppBarTitleKey');

  @override
  _LevelSelectionScreenState createState() => _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends State<LevelSelectionScreen>
    with GetItStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchLevels() async {
    await levelSelectionViewModel.fetchLevels();
  }

  @override
  Widget build(BuildContext context) {
    final levelChanged = watchOnly((LevelSelectionViewModel x) => x.changed);
    _fetchLevels();

    return Scaffold(
      appBar: AppBar(
          key: LevelSelectionScreen.levelSelectionAppBarTitleKey,
          title: Text(AppLocalizations.of(context).titleSelectLevel)),
      backgroundColor: Colors.white,
      body: SafeArea(child: _generateListView()),
    );
  }

  ListView _generateListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(40),
        itemCount: levelSelectionViewModel.levels.length,
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
        if (levelSelectionViewModel.isLevelLocked(index + 1)) {
          return _generateLockedIcon(constraint);
        }
        return _generateUnlockedIcon(constraint);
      }),
      title: Text(
        levelSelectionViewModel.levels[index].name,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text('0 / 15', style: TextStyle(color: Colors.white70)),
      onTap: () {
        levelHelper.level = index + 1;
        print('Pressed $index');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LevelScreen()),
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
