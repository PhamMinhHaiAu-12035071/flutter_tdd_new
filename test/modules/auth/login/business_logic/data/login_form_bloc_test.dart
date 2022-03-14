import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/exceptions/login_failed_exception.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/models.dart'
    as model;
import 'package:flutter_tdd_new/modules/auth/login/data/repositories/impl/mock_user_repository.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/email.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
  });
  group('LoginFormBloc', () {
    test('initial state is LoginFormState', () {
      final loginFormBloc = LoginFormBloc(userRepository: mockUserRepository);
      expect(loginFormBloc.state, const LoginFormState());
    });
    group('_onEmailChanged', () {
      const email = 'mock-email';
      blocTest<LoginFormBloc, LoginFormState>(
        'emits: [LoginFormEmailChanged]',
        build: () => LoginFormBloc(userRepository: mockUserRepository),
        act: (bloc) {
          bloc.add(const LoginFormEmailChanged(email: email));
        },
        expect: () => const <LoginFormState>[
          LoginFormState(
              email: Email.dirty(email), status: FormzStatus.invalid,),
        ],
      );
    });

    group('_onPasswordChanged', () {
      const password = 'mock-password';

      blocTest<LoginFormBloc, LoginFormState>(
        'emits: [LoginFormPasswordChanged]',
        build: () => LoginFormBloc(userRepository: mockUserRepository),
        act: (bloc) {
          bloc.add(const LoginFormPasswordChanged(password: password));
        },
        expect: () => const <LoginFormState>[
          LoginFormState(
            password: Password.dirty(password),
            status: FormzStatus.invalid,
          )
        ],
      );
    });

    group('_onEmailChanged and _onPasswordChanged', () {
      const email = 'mock-email';
      const password = 'mock-password';

      blocTest<LoginFormBloc, LoginFormState>(
        'emits: [LoginFormEmailChanged, LoginFormPasswordChanged]',
        build: () => LoginFormBloc(
          userRepository: mockUserRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginFormEmailChanged(email: email))
            ..add(const LoginFormPasswordChanged(password: password));
        },
        expect: () => const <LoginFormState>[
          LoginFormState(
            email: Email.dirty(email),
            status: FormzStatus.invalid,
          ),
          LoginFormState(
            email: Email.dirty(email),
            password: Password.dirty(password),
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('_onSubmitted', () {
      group('_onSubmitted failure', () {
        const email = 'mock-email';
        const password = 'mock-password';
        const error = model.Error(error: 'Missing password');
        const exception = LoginFailedException(error: error);

        blocTest<LoginFormBloc, LoginFormState>(
          'emits: [submissionInProgress, submissionFailure]',
          setUp: () {
            when(() =>
                    mockUserRepository.login(email: email, password: password),)
                .thenAnswer((_) async => const Left(exception));
          },
          build: () => LoginFormBloc(
            userRepository: mockUserRepository,
          ),
          act: (bloc) {
            bloc
              ..add(const LoginFormEmailChanged(email: email))
              ..add(const LoginFormPasswordChanged(password: password))
              ..add(const LoginFormSubmitted());
          },
          expect: () => <LoginFormState>[
            const LoginFormState(
              email: Email.dirty(email),
              status: FormzStatus.invalid,
            ),
            const LoginFormState(
              email: Email.dirty(email),
              password: Password.dirty(password),
              status: FormzStatus.valid,
            ),
            const LoginFormState(
              email: Email.dirty(email),
              password: Password.dirty(password),
              status: FormzStatus.submissionInProgress,
            ),
            LoginFormState(
              email: const Email.dirty(email),
              password: const Password.dirty(password),
              status: FormzStatus.submissionFailure,
              error: exception.toString(),
            ),
          ],
        );
      });

      group('_onSubmitted success', () {
        const email = 'valid-email';
        const password = 'valid-password';
        const token = model.Token(token: '123456');

        blocTest<LoginFormBloc, LoginFormState>(
          'emits: [submissionInProgress, submissionSuccess]',
          setUp: () {
            when(() =>
                    mockUserRepository.login(email: email, password: password),)
                .thenAnswer((_) async => const Right(token));
          },
          build: () => LoginFormBloc(userRepository: mockUserRepository),
          act: (bloc) {
            bloc
              ..add(const LoginFormEmailChanged(email: email))
              ..add(const LoginFormPasswordChanged(password: password))
              ..add(const LoginFormSubmitted());
          },
          expect: () => const <LoginFormState>[
            LoginFormState(
              email: Email.dirty(email),
              status: FormzStatus.invalid,
            ),
            LoginFormState(
              email: Email.dirty(email),
              password: Password.dirty(password),
              status: FormzStatus.valid,
            ),
            LoginFormState(
              email: Email.dirty(email),
              password: Password.dirty(password),
              status: FormzStatus.submissionInProgress,
            ),
            LoginFormState(
              email: Email.dirty(email),
              password: Password.dirty(password),
              status: FormzStatus.submissionSuccess,
            ),
          ],
        );
      });
    });
  });
}
