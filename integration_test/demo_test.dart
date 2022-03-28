import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tdd_new/main_dev.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

// Necessary for being able to enterText when not in debug mode
  binding.testTextInput.register();
  testWidgets(
    'failing test example',
    (WidgetTester tester) async {
      // Build the app.
      await app.main();
      tester.testTextInput.register();
      await tester.pumpAndSettle();
      final finder = find.byKey(const Key('loginForm_emailInput_textField'));
      await tester.showKeyboard(finder);
      await tester.tap(finder);
      await tester.enterText(finder, 'hello world');
      await tester.pump();
      final field = find.text('hello world');
      expect(field, findsOneWidget);
    },
    semanticsEnabled: false,
  );
}
