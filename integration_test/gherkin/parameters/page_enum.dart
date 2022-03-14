import 'package:gherkin/gherkin.dart';

enum Page { home, login }

class PageParameter extends CustomParameter<Page> {
  PageParameter()
      : super(PageParameter.key, RegExp('(home|login)', caseSensitive: false),
            (String input) {
          switch (input) {
            case 'home':
              return Page.home;
            case 'login':
              return Page.login;
          }
          return null;
        });
  static const String key = 'page';
}
