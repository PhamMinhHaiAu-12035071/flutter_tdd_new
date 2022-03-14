import 'package:flutter/cupertino.dart';
import 'package:gherkin/gherkin.dart';

enum StatusElement { enabled, disabled }

class StatusElementParameter extends CustomParameter<StatusElement> {
  StatusElementParameter()
      : super(StatusElementParameter.key,
            RegExp('(enabled|disabled)', caseSensitive: false), (String input) {
          debugPrint('StatusElementParameter: $input');
          switch (input) {
            case 'enabled':
              return StatusElement.enabled;
            case 'disabled':
              return StatusElement.disabled;
          }
          return null;
        });
  static const String key = 'status';
}
