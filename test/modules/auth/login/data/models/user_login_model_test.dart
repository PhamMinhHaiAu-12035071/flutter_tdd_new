import 'package:flutter_tdd_new/modules/auth/login/data/models/user_login_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test UserLogin class', () {
    test('Test initial constructor', () {
      const email = 'au@gmail.com';
      const password = '123456';
      const userLogin = UserLogin(email: email, password: password);
      expect(userLogin, isA<UserLogin>());
    });

    test('Test fromJson factory with data valid', () {
      const email = 'au@gmail.com';
      const password = '123456';
      const param = {
        'email': email,
        'password': password,
      };
      final userLoginFromJson = UserLogin.fromJson(param);
      const userLogin = UserLogin(email: email, password: password);
      expect(userLoginFromJson, userLogin);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const email = 'au@gmail.com';
      const password = '123456';
      const param = {
        'email': email,
        'password': password,
        'abc': 'abc',
      };
      final userLoginFromJson = UserLogin.fromJson(param);
      const userLogin = UserLogin(email: email, password: password);
      expect(userLoginFromJson, userLogin);
    });

    group(
        'Test fromJson factory should throw TypeError when did not have param '
        'required', () {
      test('nothing', () {
        const param1 = {
          'abc': 'abc',
        };
        expect(
          () => {UserLogin.fromJson(param1)},
          throwsA(isA<TypeError>()),
        );
      });
      test('do not have email', () {
        const param1 = {
          'password': '12 3456',
        };
        const param2 = {
          'email': null,
          'password': '123456',
        };
        expect(
          () => {UserLogin.fromJson(param1)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param2)},
          throwsA(isA<TypeError>()),
        );
      });

      test('do not have password', () {
        const param1 = {
          'email': 'au@gmail.com',
        };
        const param2 = {
          'email': 'au@gmail.com',
          'password': null,
        };
        expect(
          () => {UserLogin.fromJson(param1)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param2)},
          throwsA(isA<TypeError>()),
        );
      });
    });

    group(
        'Test fromJson factory should throw TypeError when type param is not '
        'valid', () {
      test('with email', () {
        const param1 = {
          'email': null,
          'password': '123456',
        };
        const param2 = {
          'email': 1,
          'password': '123456',
        };
        const param3 = {
          'email': 1.0,
          'password': '123456',
        };
        const param4 = {
          'email': true,
          'password': '123456',
        };
        const param5 = {
          'email': false,
          'password': '123456',
        };
        expect(
          () => {UserLogin.fromJson(param1)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param2)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param3)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param4)},
          throwsA(isA<TypeError>()),
        );

        expect(
          () => {UserLogin.fromJson(param5)},
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
