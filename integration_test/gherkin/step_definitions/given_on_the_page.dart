import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Examples:
///   Given I am on the login page
///   Given I am on the home page
///
StepDefinitionGeneric givenOnThePage = given<FlutterWidgetTesterWorld>(
  RegExp('I am on the \\w+ page'),
  (context) async {
    final tester = context.world.rawAppDriver;
    try {
      await tester.pumpAndSettle(
        const Duration(milliseconds: 100),
        EnginePhase.sendSemanticsUpdate,
      );
    } on FlutterError {
      // pump for 2 seconds and stop
      await tester.pump(const Duration(seconds: 2));
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
