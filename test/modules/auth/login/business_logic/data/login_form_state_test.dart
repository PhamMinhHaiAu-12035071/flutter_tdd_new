import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/email.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  group('LoginFormState', () {
    test('supports value comparisons', () {
      expect(const LoginFormState(), const LoginFormState());
    });

    test('returns same object when no properties are passed', () {
      expect(const LoginFormState().copyWith(), const LoginFormState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const LoginFormState().copyWith(status: FormzStatus.pure),
        const LoginFormState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      const email = Email.dirty('mock-email');
      expect(
        const LoginFormState().copyWith(email: email),
        const LoginFormState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      const password = Password.dirty('mock-password');
      expect(
        const LoginFormState().copyWith(password: password),
        const LoginFormState(password: password),
      );
    });
  });
}
