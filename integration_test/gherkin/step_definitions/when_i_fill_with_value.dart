import 'package:flutter/foundation.dart';
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

    if (kProfileMode || kReleaseMode) {
      tester.testTextInput.register();
    }

    await tester.pumpAndSettle();

    final field = find.byKey(Key(key));

    expect(field, findsOneWidget);

    await tester.tap(field);

    await tester.enterText(field, value);

    await tester.pump();
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
