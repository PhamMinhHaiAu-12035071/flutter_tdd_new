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
      final errorFromJson = Error.fromJson(const {
        'error': message,
      });
      const error = Error(error: message);
      expect(errorFromJson, error);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const message = 'Missing password';
      final errorFromJson = Error.fromJson(const {
        'error': message,
        'abc': 'abc',
      });
      const error = Error(error: message);
      expect(errorFromJson, error);
    });

    test('Test fromJson factory should throw TypeError when did not have param required', () {
      expect(
          () => {
                Error.fromJson(const {
                  'abc': 'abc',
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Error.fromJson(const {
                  'error': null,
                  'abc': 'abc',
                })
              },
          throwsA(isA<TypeError>()));
    });

    test('Test fromJson factory should throw TypeError when type param is not valid', () {
      expect(
          () => {
                Error.fromJson(const {
                  'error': null,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Error.fromJson(const {
                  'error': 1,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Error.fromJson(const {
                  'error': 1.0,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Error.fromJson(const {
                  'error': true,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Error.fromJson(const {
                  'error': false,
                })
              },
          throwsA(isA<TypeError>()));
    });
  });
}
