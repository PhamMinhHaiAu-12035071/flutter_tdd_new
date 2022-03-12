import 'package:gherkin/gherkin.dart';

enum Time { milliseconds, seconds }

class TimeParameter extends CustomParameter<Time> {
  static const String key = 'time';

  TimeParameter()
      : super(TimeParameter.key,
            RegExp(r'(milliseconds|seconds)', caseSensitive: false),
            (String input) {
          switch (input) {
            case 'milliseconds':
              return Time.milliseconds;
            case 'seconds':
              return Time.seconds;
          }
          return null;
        });
}
