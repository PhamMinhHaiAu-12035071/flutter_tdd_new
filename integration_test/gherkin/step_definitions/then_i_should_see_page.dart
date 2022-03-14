import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter_tdd_new/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../parameters/page_enum.dart';

/// Expect page.
/// Handy when you want to check the current page.
///
/// Examples:
///   Then I should see home page
///   And I should see login page
///
final thenIShouldSeePage = then1<Page, FlutterWidgetTesterWorld>(
  'I should see {${PageParameter.key}} page',
  (type, context) async {
    final tester = context.world.rawAppDriver;
    await tester.pumpAndSettle();
    switch (type) {
      case Page.home:
        expect(find.byType(HomeView), findsOneWidget);
        break;
      case Page.login:
        expect(find.byType(LoginView), findsOneWidget);
        break;
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(minutes: 5),
);
