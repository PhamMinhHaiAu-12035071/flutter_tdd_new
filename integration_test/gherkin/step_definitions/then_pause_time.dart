import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../parameters/time_enum.dart';

StepDefinitionGeneric thenPauseTime =
    then2<int, Time, FlutterWidgetTesterWorld>(
  'I pause for {int} {${TimeParameter.key}}',
  (duration, type, context) async {
    final tester = context.world.rawAppDriver;
    try {
      switch (type) {
        case Time.milliseconds:
          await Future<void>.delayed(Duration(milliseconds: duration));
          break;
        case Time.seconds:
          await Future<void>.delayed(Duration(seconds: duration));
          break;
      }
    } on FlutterError {
      // pump for 2 seconds and stop
      await tester.pump(const Duration(seconds: 2));
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
