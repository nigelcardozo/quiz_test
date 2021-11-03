// Import the test package and Counter class
import 'package:flutter/material.dart';
import 'package:quiz_test/utils/UiUtils.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final uiUtils = UiUtils();

    int response = uiUtils.addition(5, 2);

    expect(response, 7);
  });
}
