// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_test/about/ui/AboutScreen.dart';

import 'package:quiz_test/main.dart';

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

  testWidgets("Flutter Main Menu Test About Button Press",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var button = find.text("About");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    //expect(find.byType(AboutScreen), findsOneWidget);
  });
}
