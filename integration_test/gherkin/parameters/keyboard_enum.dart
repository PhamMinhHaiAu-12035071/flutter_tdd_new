import 'package:gherkin/gherkin.dart';

enum Keyboard { backspace }

class KeyboardParameter extends CustomParameter<Keyboard> {
  KeyboardParameter()
      : super(
            KeyboardParameter.key, RegExp('(backspace)', caseSensitive: false),
            (String input) {
          switch (input) {
            case 'backspace':
              return Keyboard.backspace;
          }
          return null;
        });
  static const String key = 'keyboard';
}
