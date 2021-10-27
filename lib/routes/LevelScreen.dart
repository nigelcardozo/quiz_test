import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz_test/routes/AnswerScreen.dart';

class LevelScreen extends StatelessWidget {
  final int level;
  final int axisCountSize = 3;

  const LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> imageList = generateImageList(level);

    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.titleLevel +
              " " +
              this.level.toString())),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: generateGridView(imageList, axisCountSize),
      ),
    );
  }
}

List<Image> generateImageList(int level) {
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

GridView generateGridView(List<Image> imageList, int axisCountSize) {
  return GridView.builder(
      itemCount: imageList.length,
      gridDelegate: generateSliverGrid(axisCountSize),
      itemBuilder: (BuildContext context, int index) {
        return generateImageCard(context, imageList, index);
      });
}

SliverGridDelegateWithFixedCrossAxisCount generateSliverGrid(int axisCount) {
  return SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount);
}

Card generateImageCard(BuildContext context, List<Image> imageList, int index) {
  return Card(
    child: new InkResponse(
      child: imageList[index],
      onTap: () {
        print(imageList[index]);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnswerScreen(image: imageList[index])),
        );
      },
    ),
  );
}
