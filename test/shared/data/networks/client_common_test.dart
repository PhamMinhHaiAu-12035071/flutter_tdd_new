import 'dart:io';

import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_common.dart';
import 'package:flutter_tdd_new/shared/data/networks/impl/client_common_impl.dart';
import 'package:flutter_tdd_new/shared/data/networks/impl/mock_client_common.dart';
import 'package:flutter_tdd_new/shared/services/http/http_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });

  group('Test ClientCommon class injection get_it with multiple environment',
      () {
    test('with environment prod', () async {
      await configureInjection(environment: Env.prod);

      expect(getIt<ClientCommon>(), isA<ClientCommonImpl>());
    });

    test('with environment stg', () async {
      await configureInjection(environment: Env.stg);

      expect(getIt<ClientCommon>(), isA<ClientCommonImpl>());
    });

    test('with environment dev', () async {
      await configureInjection(environment: Env.dev);

      expect(getIt<ClientCommon>(), isA<ClientCommonImpl>());
    });

    test('with environment test', () async {
      await configureInjection(environment: Env.test);

      expect(getIt<ClientCommon>(), isA<MockClientCommon>());
    });
  });

  group('Test method post', () {
    group('Test with add auto defaultHeader in post request', () {
      test('with not injected', () async {
        final mockClient = MockClient();
        final clientCommon = ClientCommonImpl(client: mockClient);
        final url = Uri.parse('https://google.com.vn');
        when(() => mockClient.post(url,
            headers: ClientCommonImpl.defaultHeaders,
            body: '')).thenAnswer((_) async => Response('', HttpStatus.ok));

        final result = await clientCommon.post(url, body: '');

        expect(result.statusCode, HttpStatus.ok);
        expect(result.body, '');
      });

      test('with injected', () async {
        await configureInjection(environment: Env.test);
        final url = Uri.parse('https://google.com.vn');
        when(() => getIt<Client>().post(url,
            headers: ClientCommonImpl.defaultHeaders,
            body: '')).thenAnswer((_) async => Response('', HttpStatus.ok));

        final clientCommon = ClientCommonImpl(client: getIt<Client>());

        final result = await clientCommon.post(url, body: '');

        expect(result.statusCode, HttpStatus.ok);
        expect(result.body, '');
      });
    });
  });
}
