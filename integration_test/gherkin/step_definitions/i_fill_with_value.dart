import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Expect fill key field with value
/// Handy when you want to fill value.
///
/// Examples:
///   When I fill the <email> field with "eve.holt@reqres.in"
///   When I fill the <password> field with "123456"
///
final whenFillWithValue = when2<String, String, FlutterWidgetTesterWorld>(
  'I fill the {string} field with {string}',
  (key, value, context) async {
    final tester = context.world.rawAppDriver;

    await tester.pumpAndSettle();

    final field = find.byKey(Key(key));
    await tester.showKeyboard(field);
    await tester.enterText(field, value);
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
