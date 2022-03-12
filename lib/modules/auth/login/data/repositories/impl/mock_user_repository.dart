import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Environment(Env.test)
@Singleton(as: UserRepository)
class MockUserRepository extends Mock implements UserRepository {}
