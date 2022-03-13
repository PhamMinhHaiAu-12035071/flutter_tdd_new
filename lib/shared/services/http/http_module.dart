import 'package:flutter_tdd_new/constants/env.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

@module
abstract class HttpModule {
  @Environment(Env.prod)
  @Environment(Env.stg)
  @Environment(Env.dev)
  @singleton
  http.Client get httpClient => http.Client();

  @Environment(Env.test)
  @Environment(Env.endToEndTest)
  @singleton
  http.Client get mockClient => MockClient();
}
