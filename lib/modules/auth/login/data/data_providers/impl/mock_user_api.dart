import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/user_api.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Environment(Env.test)
@Singleton(as: UserAPI)
class MockUserAPI extends Mock implements UserAPI {}
