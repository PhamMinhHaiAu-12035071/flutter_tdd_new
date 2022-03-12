import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  tearDown(() async {
    await getIt.reset();
  });
  group('Test function configureInjection', () {
    group('Test with parameter is valid', () {
      test('with environment prod', () async {
        final result = await configureInjection(environment: Env.prod);
        expect(result, isA<GetIt>());
      });

      test('with environment stg', () async {
        final result = await configureInjection(environment: Env.stg);
        expect(result, isA<GetIt>());
      });

      test('with environment dev', () async {
        final result = await configureInjection(environment: Env.dev);
        expect(result, isA<GetIt>());
      });

      test('with environment test', () async {
        final result = await configureInjection(environment: Env.test);
        expect(result, isA<GetIt>());
      });
    });

    group('Test with parameter is not valid', () {
      test('String anything', () async {
        expect(() async => {await configureInjection(environment: 'hello world')}, throwsAssertionError);
      });
    });
  });
}
