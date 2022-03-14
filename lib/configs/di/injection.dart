import 'package:flutter_tdd_new/configs/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureInjection({required String environment}) async {
  final regExpEnv = RegExp(
    r'^prod|stg|dev|test|endToEndTest$',
  );
  assert(regExpEnv.hasMatch(environment), 'Environment is not valid');
  return $initGetIt(getIt, environment: environment);
}
