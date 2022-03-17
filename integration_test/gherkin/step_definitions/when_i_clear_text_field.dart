import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

/// Handy when you want the clear text field
///
/// Examples:
///   When I clear text on the "email" field
///   And I clear text on the "password" field
///
final whenIClearTextField = when1<String, FlutterWidgetTesterWorld>(
  'I clear text on the {string} field',
  (key, context) async {
    final tester = context.world.rawAppDriver;

    await tester.idle();
    final finder = find.byKey(Key(key));
    await tester.pumpAndSettle();

    await tester.showKeyboard(finder);
    await tester.tap(finder);

    await tester.pumpAndSettle();

    if (kIsWeb) {
      await tester.enterText(finder, '');
      await tester.pumpAndSettle();
    } else {
      // Select All
      await tester.sendKeyDownEvent(
        LogicalKeyboardKey.controlLeft,
      );
      await tester.sendKeyEvent(
        LogicalKeyboardKey.keyA,
      );
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(
        LogicalKeyboardKey.controlLeft,
      );
      await tester.pumpAndSettle();
      // Delete them
      await tester.sendKeyDownEvent(
        LogicalKeyboardKey.delete,
      );
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.sendKeyUpEvent(
        LogicalKeyboardKey.delete,
      );
      await tester.pumpAndSettle();
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
