import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/token_model.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/user_repository.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/email.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/password.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

@Environment(Env.prod)
@Environment(Env.stg)
@Environment(Env.dev)
@singleton
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const LoginFormState()) {
    on<LoginFormEmailChanged>(_onEmailChanged);
    on<LoginFormPasswordChanged>(_onPasswordChanged);
    on<LoginFormSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;

  void _onEmailChanged(
      LoginFormEmailChanged event, Emitter<LoginFormState> emit) {
    final email = Email.dirty(event.email);
    final status = Formz.validate([state.password, email]);
    emit(
      state.copyWith(
        email: email,
        status: status,
      ),
    );
  }

  void _onPasswordChanged(
      LoginFormPasswordChanged event, Emitter<LoginFormState> emit) {
    final password = Password.dirty(event.password);
    final status = Formz.validate([password, state.email]);
    emit(
      state.copyWith(
        password: password,
        status: status,
      ),
    );
  }

  Future<void> _onSubmitted(
      LoginFormSubmitted event, Emitter<LoginFormState> emit) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await _userRepository.login(
          email: state.email.value, password: state.password.value);
      result.fold((Exception exception) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            error: exception.toString()));
      }, (Token token) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      });
    }
  }
}
