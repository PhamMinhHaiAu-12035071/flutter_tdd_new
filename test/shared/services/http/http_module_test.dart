import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/shared/services/http/http_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });

  group('Test http_modules inject get_it with multiple environment', () {
    test('with environment prod', () async {
      await configureInjection(environment: Env.prod);
      expect(getIt<Client>(), isA<Client>());
    });

    test('with environment stg', () async {
      await configureInjection(environment: Env.stg);
      expect(getIt<Client>(), isA<Client>());
    });

    test('with environment dev', () async {
      await configureInjection(environment: Env.dev);
      expect(getIt<Client>(), isA<Client>());
    });

    test('with environment test', () async {
      await configureInjection(environment: Env.test);
      expect(getIt<Client>(), isA<MockClient>());
    });
  });
}
