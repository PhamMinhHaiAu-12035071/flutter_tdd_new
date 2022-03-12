import 'package:flutter_tdd_new/modules/auth/login/models/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email', () {
    group('constructor', () {
      test('pure creates correct instance', () {
        const email = Email.pure();
        expect(email.value, '');
        expect(email.pure, true);
      });

      test('dirty creates correct instance', () {
        const email = Email.dirty();
        expect(email.value, '');
        expect(email.pure, false);
      });
    });

    group('validator', () {
      test('returns empty error when email is empty', () {
        expect(
          const Email.dirty('').error,
          EmailValidateError.empty,
        );
      });

      test('return valid when email is not empty', () {
        expect(
          const Email.dirty('mock-email').error,
          isNull,
        );
      });
    });
  });
}
