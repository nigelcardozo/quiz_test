import 'package:flutter/material.dart';

class UiUtils {
  Flexible generateHeightSpacer(double height) {
    return Flexible(
      child: FractionallySizedBox(
        heightFactor: height,
      ),
    );
  }

  Flexible generateLogo(double width) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: width,
        child: Image(image: AssetImage('assets/images/quizlogo.png')),
      ),
    );
  }

  Flexible generateMenuButton(BuildContext context, double width, double height,
      String menuText, Widget widget) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: width,
        heightFactor: height,
        child: ElevatedButton(
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
}
