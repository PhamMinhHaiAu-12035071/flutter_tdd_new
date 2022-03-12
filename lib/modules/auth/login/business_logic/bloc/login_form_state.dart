part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.error = '',
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String error;

  LoginFormState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    String? error,
  }) {
    return LoginFormState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [email, password, status, error];
}
