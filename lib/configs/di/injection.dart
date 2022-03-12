import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureInjection({required String environment}) async {
  final regExpEnv = RegExp(
    r'^prod|stg|dev|test$',
    caseSensitive: true,
    multiLine: false,
  );
  assert(regExpEnv.hasMatch(environment));
  return $initGetIt(getIt, environment: environment);
}
