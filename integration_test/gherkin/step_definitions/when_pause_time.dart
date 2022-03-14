import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../parameters/time_enum.dart';

/// Pauses the execution for the provided number of seconds.
/// Handy when you want to pause to check something.
/// Note: this should only be used during development as having to pause during
/// a test usually indicates timing issues
///
/// Examples:
///   When I pause for 10 microseconds
///   When I pause for 20 milliseconds
///   When I pause for 30 seconds
///   When I pause for 40 minutes
///   When I pause for 1 hours

StepDefinitionGeneric whenPauseTime =
    when2<int, Time, FlutterWidgetTesterWorld>(
  'I pause for {int} {${TimeParameter.key}}',
  (duration, type, context) async {
    switch (type) {
      case Time.microseconds:
        await Future<void>.delayed(Duration(microseconds: duration));
        break;
      case Time.milliseconds:
        await Future<void>.delayed(Duration(milliseconds: duration));
        break;
      case Time.seconds:
        await Future<void>.delayed(Duration(seconds: duration));
        break;
      case Time.minutes:
        await Future<void>.delayed(Duration(minutes: duration));
        break;
      case Time.hours:
        await Future<void>.delayed(Duration(hours: duration));
        break;
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
