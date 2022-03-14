import 'dart:convert';
import 'dart:io';

import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/user_api.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_common.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart' as mock;

class MockApiLogin {
  MockApiLogin() {
    const dataSuccess = {
      'email': 'eve.holt@reqres.in',
      'password': 'cityslicka',
    };
    const dataFailed = {
      'email': 'eve.holt@reqres.in',
      'password': '123456',
    };
    final url = Uri.parse(
      '${getIt<FlavorConfig>().baseUrl}'
      '${getIt<UserAPI>().pathLogin}',
    );
    mock
        .when(
          () => getIt<Client>().post(
            url,
            headers: getIt<ClientCommon>().defaultHeaders,
            body: jsonEncode(dataFailed),
          ),
        )
        .thenAnswer(
          (_) async =>
              Response('{"error": "Missing password"}', HttpStatus.badRequest),
        );
    mock
        .when(
          () => getIt<Client>().post(
            url,
            headers: getIt<ClientCommon>().defaultHeaders,
            body: jsonEncode(dataSuccess),
          ),
        )
        .thenAnswer(
          (_) async =>
              Response('{"token": "QpwL5tke4Pnpja7X4"}', HttpStatus.ok),
        );
  }
}
