import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginFormEvent', () {
    group('LoginFormEmailChanged', () {
      test('supports value comparisons', () {
        const email = 'mock-email';
        return expect(const LoginFormEmailChanged(email: email),
            const LoginFormEmailChanged(email: email));
      });
    });

    group('LoginFormPasswordChanged', () {
      test('supports value comparisons', () {
        const password = 'mock-password';
        expect(const LoginFormPasswordChanged(password: password),
            const LoginFormPasswordChanged(password: password));
      });
    });

    group('LoginFormSubmitted', () {
      test('supports value comparisons', () {
        expect(const LoginFormSubmitted(), const LoginFormSubmitted());
      });
    });
  });
}
