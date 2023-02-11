// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:testing_demo/main.dart';

void main() {
  testGoldens('Counter devices test', (WidgetTester tester) async {
    // await loadAppFonts();
    // Build our app and trigger a frame.
    final deviceBuilder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(widget: MyApp());
    await tester.pumpDeviceBuilder(deviceBuilder);
    await screenMatchesGolden(tester, 'my_app');
  });
}
