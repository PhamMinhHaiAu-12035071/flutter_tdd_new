import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/impl/mock_user_repository.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/impl/user_repository_impl.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });
  group('Test UserRepository class injection get_it with multiple environment',
      () {
    test('with environment prod', () async {
      await configureInjection(environment: Env.prod);
      expect(getIt<UserRepository>(), isA<UserRepositoryImpl>());
    });

    test('with environment stg', () async {
      await configureInjection(environment: Env.stg);
      expect(getIt<UserRepository>(), isA<UserRepositoryImpl>());
    });

    test('with environment dev', () async {
      await configureInjection(environment: Env.dev);
      expect(getIt<UserRepository>(), isA<UserRepositoryImpl>());
    });

    test('with environment test', () async {
      await configureInjection(environment: Env.test);
      expect(getIt<UserRepository>(), isA<MockUserRepository>());
    });
  });
}
