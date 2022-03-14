import 'package:flutter/services.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../parameters/keyboard_enum.dart';

/// Pressed the keyboard any.
/// Handy when you want to press the keyboard.
///
/// Examples:
///   When I press the backspace keyboard 6 times
///   When I press the backspace keyboard 1 time
///
StepDefinitionGeneric whenIPressKeyboardNTimes =
    when2<Keyboard, int, FlutterWidgetTesterWorld>(
  'I press the {${KeyboardParameter.key}} keyboard {int} time(s)',
  (type, times, context) async {
    final tester = context.world.rawAppDriver;
    const time = 550;
    const speed = 35;
    switch (type) {
      case Keyboard.backspace:
        for (var i = 0; i < times; i++) {
          final timeDelayed = time - i * speed;
          await Future<Duration>.delayed(Duration(milliseconds: timeDelayed));
          await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
          await tester.pump();
        }
        break;
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
