import 'dart:convert';
import 'dart:io';

import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/flavors/impl/mock_flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/impl/mock_user_api.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/impl/user_api_impl.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/user_api.dart';
import 'package:flutter_tdd_new/shared/data/networks/impl/mock_client_common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });

  group('Test UserAPI class injection get_it with multiple environment', () {
    test('with environment prod', () async {
      await configureInjection(environment: Env.prod);

      expect(getIt<UserAPI>(), isA<UserAPIImpl>());
    });

    test('with environment stg', () async {
      await configureInjection(environment: Env.stg);

      expect(getIt<UserAPI>(), isA<UserAPIImpl>());
    });

    test('with environment dev', () async {
      await configureInjection(environment: Env.dev);

      expect(getIt<UserAPI>(), isA<UserAPIImpl>());
    });

    test('with environment test', () async {
      await configureInjection(environment: Env.test);

      expect(getIt<UserAPI>(), isA<MockUserAPI>());
    });
  });

  test('Test method login success and failed', () async {
    final mockFlavorConfig = MockFlavorConfig();
    when(() => mockFlavorConfig.baseUrl).thenReturn('https://reqres.in');

    final mockClientCommon = MockClientCommon();
    final url = Uri.parse('https://reqres.in/api/login');
    const email = 'eve.holt@reqres.in';
    const passwordSuccess = 'cityslicka';
    const passwordFailed = 'mock-password';
    const dataSuccess = {
      'email': email,
      'password': passwordSuccess,
    };
    const dataFailed = {
      'email': email,
      'password': passwordFailed,
    };
    when(() => mockClientCommon.post(url, body: jsonEncode(dataFailed)))
        .thenAnswer(
      (_) async =>
          Response('{"error": "Missing password"}', HttpStatus.badRequest),
    );
    when(() => mockClientCommon.post(url, body: jsonEncode(dataSuccess)))
        .thenAnswer(
      (_) async => Response('{"token": "QpwL5tke4Pnpja7X4"}', HttpStatus.ok),
    );

    final userApiImpl = UserAPIImpl(
      flavorConfig: mockFlavorConfig,
      clientCommon: mockClientCommon,
    );
    final result =
        await userApiImpl.login(email: email, password: passwordSuccess);
    final resultFailed =
        await userApiImpl.login(email: email, password: passwordFailed);

    expect(result.statusCode, HttpStatus.ok);
    expect(resultFailed.statusCode, HttpStatus.badRequest);
  });
}
