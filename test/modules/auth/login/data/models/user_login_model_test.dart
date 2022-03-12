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
      final userLoginFromJson = UserLogin.fromJson(const {
        'email': email,
        'password': password,
      });
      const userLogin = UserLogin(email: email, password: password);
      expect(userLoginFromJson, userLogin);
    });

    test('Test fromJson factory with pass redundant parameter', () {
      const email = 'au@gmail.com';
      const password = '123456';
      final userLoginFromJson = UserLogin.fromJson(const {
        'email': email,
        'password': password,
        'abc': 'abc',
      });
      const userLogin = UserLogin(email: email, password: password);
      expect(userLoginFromJson, userLogin);
    });

    group('Test fromJson factory should throw TypeError when did not have param required', () {
      test('nothing', () {
        expect(
            () => {
                  UserLogin.fromJson(const {
                    'abc': 'abc',
                  })
                },
            throwsA(isA<TypeError>()));
        expect(() => {UserLogin.fromJson(const {})}, throwsA(isA<TypeError>()));
      });
      test('do not have email', () {
        expect(
            () => {
                  UserLogin.fromJson(const {
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': null,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));
      });

      test('do not have password', () {
        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': 'au@gmail.com',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': 'au@gmail.com',
                    'password': null,
                  })
                },
            throwsA(isA<TypeError>()));
      });
    });

    group('Test fromJson factory should throw TypeError when type param is not valid', () {
      test('with email', () {
        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': null,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': 1,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': 1.0,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': true,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));

        expect(
            () => {
                  UserLogin.fromJson(const {
                    'email': false,
                    'password': '123456',
                  })
                },
            throwsA(isA<TypeError>()));
      });
    });
  });
}
