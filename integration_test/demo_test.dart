import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tdd_new/main_dev.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

// Necessary for being able to enterText when not in debug mode
  binding.testTextInput.register();
  testWidgets('failing test example', (WidgetTester tester) async {
    // Build the app.
    await app.main();

    await tester.pumpAndSettle();
    final finder = find.byKey(const Key('loginForm_emailInput_textField'));
    await tester.idle();
    await tester.showKeyboard(finder);
    await tester.tap(finder);
    await tester.enterText(finder, 'hello world');
    // Select All
    final resultPressKeyA = await tester.sendKeyDownEvent(
      LogicalKeyboardKey.keyA,
    );
    debugPrint('show result when pressed keyA: $resultPressKeyA');
    await tester.pump();
    await Future<dynamic>.delayed(const Duration(seconds: 20));
    // final resultKeyUpKeyA = await tester.sendKeyUpEvent(
    //   LogicalKeyboardKey.control,
    // );
    // debugPrint('show result when key up keyA: $resultKeyUpKeyA');
    // await tester.pumpAndSettle();
    // // Delete them
    // final resultPressedKeyDelete = await tester.sendKeyDownEvent(
    //   LogicalKeyboardKey.delete,
    // );
    // debugPrint('show result when pressed delete: $resultPressedKeyDelete');
    // await tester.pumpAndSettle();
    // await tester.pump(const Duration(milliseconds: 200));
    // final resultKeyUpDelete = await tester.sendKeyUpEvent(
    //   LogicalKeyboardKey.delete,
    // );
    // debugPrint('show result when key up delete: $resultKeyUpDelete');
    // await tester.pumpAndSettle();
  });
}
