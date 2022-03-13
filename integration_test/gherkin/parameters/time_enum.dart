import 'package:gherkin/gherkin.dart';

enum Time { microseconds, milliseconds, seconds, minutes, hours }

class TimeParameter extends CustomParameter<Time> {
  static const String key = 'time';

  TimeParameter()
      : super(
            TimeParameter.key,
            RegExp(r'(microseconds|milliseconds|seconds|minues|hours)',
                caseSensitive: false), (String input) {
          switch (input) {
            case 'microseconds':
              return Time.microseconds;
            case 'milliseconds':
              return Time.milliseconds;
            case 'seconds':
              return Time.seconds;
            case 'minutes':
              return Time.minutes;
            case 'hours':
              return Time.hours;
          }
          return null;
        });
}
