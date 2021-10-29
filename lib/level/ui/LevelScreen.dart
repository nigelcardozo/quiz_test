import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/answer/ui/AnswerScreen.dart';

class LevelScreen extends StatefulWidget {
  final int level;

  LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final int axisCountSize = 3;
  List<Image> imageList = [];
  List<String> answerList = [];

  @override
  Widget build(BuildContext context) {
    imageList = _generateImageList(widget.level);
    answerList = _generateAnswerList(widget.level);

    return Scaffold(
      appBar: AppBar(title: Text(_getTitle(context, widget.level))),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _generateGridView(imageList, answerList, axisCountSize),
      ),
    );
  }

  String _getTitle(BuildContext context, int level) {
    return AppLocalizations.of(context)!.titleLevel + " " + level.toString();
  }

  GridView _generateGridView(
      List<Image> imageList, List<String> answerList, int axisCountSize) {
    return GridView.builder(
        itemCount: imageList.length,
        gridDelegate: _generateSliverGrid(axisCountSize),
        itemBuilder: (BuildContext context, int index) {
          return _generateImageCard(context, imageList, answerList, index);
        });
  }

  SliverGridDelegateWithFixedCrossAxisCount _generateSliverGrid(int axisCount) {
    return SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount);
  }

  Card _generateImageCard(BuildContext context, List<Image> imageList,
      List<String> answerList, int index) {
    return Card(
      child: new InkResponse(
        child: imageList[index],
        onTap: () {
          _launchAnswerScreen(context, imageList, answerList, index);
        },
      ),
    );
  }

  void _launchAnswerScreen(BuildContext context, List<Image> imageList,
      List<String> answerList, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AnswerScreen(image: imageList[index], answer: answerList[index])),
    );
  }

  List<String> _generateAnswerList(int level) {
    List<String> answerList = <String>[];

    if (level == 1) {
      answerList.add('mickey');
      answerList.add('minnie');
      answerList.add('goofy');
      answerList.add('pluto');
      answerList.add('ariel');
      answerList.add('jasmine');
      answerList.add('maleficent');
      answerList.add('eeyore');
      answerList.add('pooh');
      answerList.add('tigger');
      answerList.add('alice');
      answerList.add('dumbo');
      answerList.add('robin');
      answerList.add('bambi');
      answerList.add('thumper');
      answerList.add('todd');
      answerList.add('aladdin');
      answerList.add('copper');
    } else if (level == 2) {
      answerList.add('cruella');
      answerList.add('darth');
      answerList.add('stitch');
      answerList.add('olaf');
      answerList.add('anna');
      answerList.add('lilo');
      answerList.add('ralph');
      answerList.add('forky');
      answerList.add('buzz');
      answerList.add('r2d2');
      answerList.add('homer');
      answerList.add('lisa');
      answerList.add('krusty');
      answerList.add('kermit');
      answerList.add('gonzo');
      answerList.add('jack');
      answerList.add('mulan');
      answerList.add('nemo');
    } else if (level == 3) {
      answerList.add('mushu');
      answerList.add('bolt');
      answerList.add('boo');
      answerList.add('jessie');
      answerList.add('mater');
      answerList.add('russell');
      answerList.add('tinkerbell');
      answerList.add('beast');
      answerList.add('gaston');
      answerList.add('rapunzel');
      answerList.add('marge');
      answerList.add('beaker');
      answerList.add('animal');
      answerList.add('moana');
      answerList.add('wendy');
      answerList.add('mowgli');
      answerList.add('marie');
      answerList.add('remy');
    }

    return answerList;
  }

  List<Image> _generateImageList(int level) {
    List<Image> imageList = <Image>[];

    if (level == 1) {
      imageList.add(Image(image: AssetImage('assets/images/levels/1/101.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/102.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/103.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/104.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/105.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/106.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/107.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/108.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/109.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/110.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/111.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/112.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/113.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/114.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/115.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/116.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/117.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/1/118.png')));
    } else if (level == 2) {
      imageList.add(Image(image: AssetImage('assets/images/levels/2/201.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/202.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/203.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/204.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/205.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/206.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/207.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/208.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/209.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/210.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/211.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/212.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/213.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/214.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/215.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/216.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/217.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/2/218.png')));
    } else if (level == 3) {
      imageList.add(Image(image: AssetImage('assets/images/levels/3/301.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/302.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/303.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/304.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/305.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/306.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/307.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/308.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/309.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/310.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/311.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/312.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/313.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/314.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/315.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/316.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/317.png')));
      imageList.add(Image(image: AssetImage('assets/images/levels/3/318.png')));
    }

    return imageList;
  }
}
