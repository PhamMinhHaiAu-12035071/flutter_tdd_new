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
      const param = {
        'token': rawToken,
      };
      final tokenFromJson = Token.fromJson(param);
      const token = Token(token: rawToken);
      expect(tokenFromJson, token);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const rawToken = '123456';
      const param = {
        'token': rawToken,
        'abc': 'abc',
      };
      final tokenFromJson = Token.fromJson(param);
      const token = Token(token: rawToken);
      expect(tokenFromJson, token);
    });

    test(
        'Test fromJson factory should throw TypeError when did not have param '
        'required', () {
      const param1 = {
        'abc': 'abc',
      };
      const param2 = {
        'token': null,
        'abc': 'abc',
      };
      expect(
        () => {Token.fromJson(param1)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Token.fromJson(param2)},
        throwsA(isA<TypeError>()),
      );
    });

    test(
        'Test fromJson factory should throw TypeError when type param is not '
        'valid', () {
      const param1 = {
        'token': null,
      };
      const param2 = {
        'token': 1,
      };
      const param3 = {
        'token': 1.0,
      };
      const param4 = {
        'token': true,
      };
      const param5 = {
        'token': false,
      };
      expect(
        () => {Token.fromJson(param1)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Token.fromJson(param2)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Token.fromJson(param3)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Token.fromJson(param4)},
        throwsA(isA<TypeError>()),
      );

      expect(
        () => {Token.fromJson(param5)},
        throwsA(isA<TypeError>()),
      );
    });
  });
}
