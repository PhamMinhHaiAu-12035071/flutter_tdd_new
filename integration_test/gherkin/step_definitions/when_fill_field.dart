import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

final whenFillField = when2<String, String, FlutterWidgetTesterWorld>(
  'I fill the {string} field with {string}',
  (key, value, context) async {
    final tester = context.world.rawAppDriver;

    try {
      await tester.pumpAndSettle(
        const Duration(milliseconds: 100),
        EnginePhase.sendSemanticsUpdate,
      );

      final field = find.byKey(Key(key));

      await tester.pumpAndSettle(
        const Duration(milliseconds: 100),
        EnginePhase.sendSemanticsUpdate,
      );
      await tester.tap(field);
      await tester.showKeyboard(field);

      await tester.enterText(field, value);
    } on FlutterError {
      // pump for 2 seconds and stop
      await tester.pump(const Duration(seconds: 2));
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
