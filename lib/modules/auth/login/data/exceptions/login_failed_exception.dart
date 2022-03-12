import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/error_model.dart';

class LoginFailedException extends Equatable implements Exception {
  const LoginFailedException({required this.error});

  final Error error;

  @override
  String toString() {
    return error.error;
  }

  @override
  List<Object?> get props => [error];
}
