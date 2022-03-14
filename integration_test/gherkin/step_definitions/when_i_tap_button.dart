import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Expected button is pressed
/// Handy when you want to tap the button.
///
/// Examples:
///   When I tap the "Login" button
///   When I tap the "Submit" button
///

final whenITapButton = when1<String, FlutterWidgetTesterWorld>(
  'I tap the {string} button',
  (value, context) async {
    final tester = context.world.rawAppDriver;

    await tester.pumpAndSettle();

    final list = find.byType(ElevatedButton).evaluate();
    for (final child in list) {
      final childWidget = child.widget;
      if (childWidget is ElevatedButton) {
        final btnWidget = childWidget;
        final innerChild = btnWidget.child;
        if (innerChild is Text) {
          final textWidget = innerChild;
          final text = textWidget.data;
          if (text == value) {
            await tester.tap(find.byWidget(childWidget));
          }
        }
      }
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
