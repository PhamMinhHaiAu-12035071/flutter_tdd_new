import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Expect value to show on the current page.
/// Handy when you want to check value should exist.
///
/// Examples:
///   I see "eve.holt@reqres.in" on the login page
///   I see "hello world" on the home page
///
final thenExpectFieldWithValue = then1<String, FlutterWidgetTesterWorld>(
  RegExp('I see {string} on the \\w+ page'),
  (value, context) async {
    final tester = context.world.rawAppDriver;

    try {
      await tester.pumpAndSettle(
        const Duration(milliseconds: 100),
        EnginePhase.sendSemanticsUpdate,
      );

      final field = find.text(value);
      expect(field, findsOneWidget);
    } on FlutterError {
      // pump for 2 seconds and stop
      await tester.pump(const Duration(seconds: 2));
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
