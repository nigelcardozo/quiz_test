import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';

import 'package:quiz_test/main.dart';
import 'package:quiz_test/main_menu/ui/MainMenuScreen.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets("Flutter Main Menu Num Widgets", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var textField = find.byType(Flexible);
    expect(textField, findsNWidgets(6));
  });

  testWidgets("Flutter Main Menu Num Text Buttons",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var textField = find.byType(Text);
    expect(textField, findsNWidgets(2));
  });

  testWidgets("Flutter Main Menu Test Menu Button Play",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var button = find.text("Play");
    expect(button, findsOneWidget);
  });

  testWidgets("Flutter Main Menu Test Menu Button About",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var button = find.text("About");
    expect(button, findsOneWidget);
  });

  // testWidgets("Flutter Main Menu Test Logo", (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var logo = find.byType(Image).evaluate().single.widget as Image;
  // });
}
