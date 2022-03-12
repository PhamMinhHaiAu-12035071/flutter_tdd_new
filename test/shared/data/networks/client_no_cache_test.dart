import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_no_cache.dart';
import 'package:flutter_tdd_new/shared/data/networks/impl/client_no_cache_impl.dart';
import 'package:flutter_tdd_new/shared/data/networks/impl/mock_client_no_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });

  group('Test ClientNoCache class injection get_it with multiple environment', () {
    test('with environment prod', () async {
      await configureInjection(environment: Env.prod);
      expect(getIt<ClientNoCache>(), isA<ClientNoCacheImpl>());
    });

    test('with environment stg', () async {
      await configureInjection(environment: Env.stg);
      expect(getIt<ClientNoCache>(), isA<ClientNoCacheImpl>());
    });

    test('with environment dev', () async {
      await configureInjection(environment: Env.dev);
      expect(getIt<ClientNoCache>(), isA<ClientNoCacheImpl>());
    });

    test('with environment test', () async {
      await configureInjection(environment: Env.test);
      expect(getIt<ClientNoCache>(), isA<MockClientNoCache>());
    });
  });
}
