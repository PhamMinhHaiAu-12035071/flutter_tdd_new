import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/user_api.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/exceptions/login_failed_exception.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/error_model.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/token_model.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.prod)
@Environment(Env.stg)
@Environment(Env.dev)
@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required UserAPI userAPI}) : _userAPI = userAPI;

  final UserAPI _userAPI;
  @override
  Future<Either<Exception, Token>> login({required String email, required String password}) async {
    final response = await _userAPI.login(email: email, password: password);
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final token = Token.fromJson(data);
        return Right(token);
      case HttpStatus.badRequest:
        final error = Error.fromJson(data);
        return Left(LoginFailedException(error: error));
      default:
        final error = Error.fromJson(data);
        return Left(LoginFailedException(error: error));
    }
  }
}
