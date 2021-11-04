import 'package:flutter/material.dart';

// TEMPORARY FOR UNIT TEST PURPOSES ONLY
int addition(int x, int y) {
  return x + y;
}

Flexible generateHeightSpacer(double height, Key key) {
  return Flexible(
    child: FractionallySizedBox(
      key: key,
      heightFactor: height,
    ),
  );
}

Flexible generateLogo(double width, Key key) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      child: Image(key: key, image: AssetImage('assets/images/quizlogo.png')),
    ),
  );
}

Flexible generateMenuButton(BuildContext context, double width, double height,
    String menuText, Key key, Widget widget) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: width,
      heightFactor: height,
      child: ElevatedButton(
        key: key,
        child: Text(menuText),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
      ),
    ),
  );
}

Flexible generateImage(Image image) {
  return Flexible(
    child: FractionallySizedBox(
      child: image,
    ),
  );
}
