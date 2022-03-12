import 'package:flutter_tdd_new/modules/auth/login/data/models/token_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Token class', () {
    test('Test initial constructor', () {
      const rawToken = '123456';
      const token = Token(token: rawToken);
      expect(token, isA<Token>());
    });

    test('Test fromJson factory with data valid', () {
      const rawToken = '123456';
      final tokenFromJson = Token.fromJson(const {
        'token': rawToken,
      });
      const token = Token(token: rawToken);
      expect(tokenFromJson, token);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const rawToken = '123456';
      final tokenFromJson = Token.fromJson(const {
        'token': rawToken,
        'abc': 'abc',
      });
      const token = Token(token: rawToken);
      expect(tokenFromJson, token);
    });

    test('Test fromJson factory should throw TypeError when did not have param required', () {
      expect(
          () => {
                Token.fromJson(const {
                  'abc': 'abc',
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Token.fromJson(const {
                  'token': null,
                  'abc': 'abc',
                })
              },
          throwsA(isA<TypeError>()));
    });

    test('Test fromJson factory should throw TypeError when type param is not valid', () {
      expect(
          () => {
                Token.fromJson(const {
                  'token': null,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Token.fromJson(const {
                  'token': 1,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Token.fromJson(const {
                  'token': 1.0,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Token.fromJson(const {
                  'token': true,
                })
              },
          throwsA(isA<TypeError>()));

      expect(
          () => {
                Token.fromJson(const {
                  'token': false,
                })
              },
          throwsA(isA<TypeError>()));
    });
  });
}
