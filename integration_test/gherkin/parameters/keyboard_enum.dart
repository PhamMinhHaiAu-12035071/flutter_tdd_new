import 'package:gherkin/gherkin.dart';

enum Keyboard { backspace }

class KeyboardParameter extends CustomParameter<Keyboard> {
  static const String key = 'keyboard';

  KeyboardParameter()
      : super(
            KeyboardParameter.key, RegExp(r'(backspace)', caseSensitive: false),
            (String input) {
          switch (input) {
            case 'backspace':
              return Keyboard.backspace;
          }
          return null;
        });
}
