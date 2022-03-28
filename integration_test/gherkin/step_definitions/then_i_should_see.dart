import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Expect value to show on the current page.
/// Handy when you want to check value should exist.
///
/// Examples:
///   Then I should see "eve.holt@reqres.in"
///   And I should see "hello world"
///
final thenIShouldSee = then1<String, FlutterWidgetTesterWorld>(
  'I should see {string}',
  (value, context) async {
    final tester = context.world.rawAppDriver;
    await tester.pumpAndSettle();

    final field = find.text(value);
    expect(field, findsOneWidget);
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(
      minutes: 5,
    ),
);
