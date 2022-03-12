import 'package:flutter_tdd_new/modules/auth/login/models/password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Password', () {
    group('constructor', () {
      test('pure creates correct instance', () {
        const password = Password.pure();
        expect(password.value, '');
        expect(password.pure, true);
      });

      test('dirty creates correct instance', () {
        const password = Password.dirty();
        expect(password.value, '');
        expect(password.pure, false);
      });
    });

    group('validator', () {
      test('returns empty error when password is empty', () {
        expect(
          const Password.dirty('').error,
          PasswordValidateError.empty,
        );
      });

      test('returns valid when password is not empty', () {
        expect(
          const Password.dirty('mock-password').error,
          isNull,
        );
      });
    });
  });
}
