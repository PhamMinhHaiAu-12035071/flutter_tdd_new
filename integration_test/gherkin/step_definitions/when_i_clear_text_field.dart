import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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

    await tester.pumpAndSettle();

    final finder = find.byKey(Key(key));

    await tester.showKeyboard(finder);
    await tester.tap(finder);
    await tester.sendKeyDownEvent(
      LogicalKeyboardKey.control,
    );
    await tester.sendKeyDownEvent(
      LogicalKeyboardKey.keyA,
    );
    await tester.sendKeyDownEvent(
      LogicalKeyboardKey.backspace,
    );
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
