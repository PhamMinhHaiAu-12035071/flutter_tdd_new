import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../parameters/status_element_enum.dart';

/// Expected the status of the button.
/// Handy when you want to know the status of the button.
///
/// Examples:
///   Then I expect the "Login" button to be enabled
///   Then I expect the "Login" button to be disabled
///

final thenExpectStateButton =
    then2<String, StatusElement, FlutterWidgetTesterWorld>(
  'I expect the {string} button to be {${StatusElementParameter.key}}',
  (value, state, context) async {
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
            switch (state) {
              case StatusElement.enabled:
                expect(btnWidget.enabled, true);
                break;
              case StatusElement.disabled:
                expect(btnWidget.enabled, false);
                break;
            }
          }
        }
      }
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
