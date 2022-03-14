import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

/// Examples:
///   Given I am on the login page
///   Given I am on the home page
///
final givenOnThePage = given<FlutterWidgetTesterWorld>(
  RegExp(r'I am on the \w+ page'),
  (context) async {
    final tester = context.world.rawAppDriver;
    await tester.pumpAndSettle();
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
