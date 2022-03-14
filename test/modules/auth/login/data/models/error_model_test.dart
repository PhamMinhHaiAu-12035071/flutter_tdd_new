import 'package:flutter_tdd_new/modules/auth/login/data/models/error_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Error class', () {
    test('Test initial constructor', () {
      const message = 'Missing password';
      const error = Error(error: message);
      expect(error, isA<Error>());
    });

    test('Test fromJson factory with data valid', () {
      const message = 'Missing password';
      const params = {
        'error': message,
      };
      final errorFromJson = Error.fromJson(params);
      const error = Error(error: message);
      expect(errorFromJson, error);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const message = 'Missing password';
      const params = {
        'error': message,
        'abc': 'abc',
      };
      final errorFromJson = Error.fromJson(params);
      const error = Error(error: message);
      expect(errorFromJson, error);
    });

    test(
        'Test fromJson factory should throw TypeError when did not have param '
        'required', () {
      const param1 = {
        'abc': 'abc',
      };

      const param2 = {
        'error': null,
        'abc': 'abc',
      };
      expect(
        () => {Error.fromJson(param1)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Error.fromJson(param2)},
        throwsA(isA<TypeError>()),
      );
    });

    test(
        'Test fromJson factory should throw TypeError when type param is not '
        'valid', () {
      const param1 = {
        'error': null,
      };
      const param2 = {
        'error': 1,
      };
      const param3 = {
        'error': 1.0,
      };
      const param4 = {
        'error': true,
      };
      const param5 = {
        'error': false,
      };
      expect(
        () => {Error.fromJson(param1)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Error.fromJson(param2)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Error.fromJson(param3)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Error.fromJson(param4)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Error.fromJson(param5)},
        throwsA(isA<TypeError>()),
      );
    });
  });
}
