part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

class LoginFormEmailChanged extends LoginFormEvent {
  const LoginFormEmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginFormPasswordChanged extends LoginFormEvent {
  const LoginFormPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginFormSubmitted extends LoginFormEvent {
  const LoginFormSubmitted();
}
