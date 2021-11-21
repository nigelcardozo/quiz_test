import 'package:flutter/material.dart';
import 'package:quiz_test/utils/ui_utils.dart';
import 'package:test/test.dart';

void main() {
  test('Test generateHeightSpacer returns correctly created object', () {
    const mainMenuHeightSpacerKey1 = Key('mainMenuHeightSpacerKey1');

    Flexible response =
        UiUtils().generateHeightSpacer(0.2, mainMenuHeightSpacerKey1);

    expect(response.child, isA<FractionallySizedBox>());

    FractionallySizedBox child = response.child as FractionallySizedBox;

    expect(child.key, mainMenuHeightSpacerKey1);
    expect(child.heightFactor, 0.2);
  });

  test('Test generateLogo returns correctly created object', () {
    const mainMenuLogoKey = Key('mainMenuLogoKey');

    Flexible response = UiUtils().generateLogo(0.8, mainMenuLogoKey);

    expect(response.child, isA<FractionallySizedBox>());

    FractionallySizedBox child = response.child as FractionallySizedBox;
    expect(child.widthFactor, 0.8);

    Image image = child.child as Image;
    expect(image.key, mainMenuLogoKey);

    AssetImage assetImage = image.image as AssetImage;
    expect(assetImage.assetName, "assets/images/quizlogo.png");
  });

  test('Test generateImage returns correctly created object', () {
    Image testImage = Image(image: AssetImage("assets/levels/101.png"));

    Flexible response = UiUtils().generateImage(testImage);

    expect(response.child, isA<FractionallySizedBox>());

    FractionallySizedBox child = response.child as FractionallySizedBox;

    Image image = child.child as Image;

    AssetImage assetImage = image.image as AssetImage;
    expect(assetImage.assetName, "assets/levels/101.png");
  });
}
