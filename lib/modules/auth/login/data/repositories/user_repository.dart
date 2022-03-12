import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/token_model.dart';

abstract class UserRepository {
  Future<Either<Exception, Token>> login({required String email, required String password});
}
