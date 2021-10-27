import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LevelScreen extends StatelessWidget {
  final int level;
  final int axisCountSize = 3;

  const LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> imageList = generateImageList(level);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.titleLevel)),
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
  }

  return imageList;
}

GridView generateGridView(List<Image> imageList, int axisCountSize) {
  return GridView.builder(
      itemCount: imageList.length,
      gridDelegate: generateSliverGrid(axisCountSize),
      itemBuilder: (BuildContext context, int index) {
        return generateImageCard(imageList, index);
      });
}

SliverGridDelegateWithFixedCrossAxisCount generateSliverGrid(int axisCount) {
  return SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount);
}

Card generateImageCard(List<Image> imageList, int index) {
  return Card(
    child: new InkResponse(
      child: imageList[index],
      onTap: () {
        print(index);
      },
    ),
  );
}
