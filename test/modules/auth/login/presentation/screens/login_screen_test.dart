import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/routers/e_route_information_parser.dart';
import 'package:flutter_tdd_new/configs/routers/e_router_delegate.dart';
import 'package:flutter_tdd_new/configs/routers/navigation_cubit.dart';
import 'package:flutter_tdd_new/configs/routers/page_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/authentication_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/email_input.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/login_button.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/password_input.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/text_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigationCubit extends Mock implements NavigationCubit {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

void main() {
  setUp(() async {
    await configureInjection(environment: Env.test);
  });
  tearDown(() async {
    await getIt.reset();
  });
  group('LoginScreen', () {
    testWidgets('renders a LoginView ', (tester) async {
      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState());
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );

      expect(find.byType(LoginView), findsOneWidget);
    });

    testWidgets(
        'adds LoginFormEmailChanged to LoginFormBloc when email is updated ',
        (tester) async {
      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState());
      const email = 'mock-email';
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );

      await tester.enterText(find.byKey(EmailInput.emailKey), email);
      verify(
        () => getIt<LoginFormBloc>()
            .add(const LoginFormEmailChanged(email: email)),
      ).called(1);
    });

    testWidgets(
        'adds LoginFormPasswordChanged to LoginFormBloc when password is updated ',
        (tester) async {
      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState());
      const password = 'mock-password';
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );

      await tester.enterText(find.byKey(PasswordInput.passwordKey), password);
      verify(
        () => getIt<LoginFormBloc>()
            .add(const LoginFormPasswordChanged(password: password)),
      ).called(1);
    });

    testWidgets('continue button is disabled by default', (tester) async {
      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState());
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );

      final button =
          tester.widget<ElevatedButton>(find.byKey(LoginButton.buttonKey));
      expect(button.enabled, isFalse);
    });

    testWidgets(
        'loading indicator is shown when status is submission in progress',
        (tester) async {
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      whenListen(
        getIt<LoginFormBloc>(),
        Stream.fromIterable(
          [
            const LoginFormState(status: FormzStatus.submissionInProgress),
          ],
        ),
        initialState: const LoginFormState(),
      );
      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );
      await tester.pump();
      expect(find.byKey(LoginView.loadingKey), findsOneWidget);
    });

    testWidgets('continue button is enabled when status is validated',
        (tester) async {
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState(status: FormzStatus.valid));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );
      final button =
          tester.widget<ElevatedButton>(find.byKey(LoginButton.buttonKey));
      expect(button.enabled, isTrue);
    });

    testWidgets(
        'LoginFormSubmitted is added to LoginBloc when continue is tapped',
        (tester) async {
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      when(() => getIt<LoginFormBloc>().state)
          .thenReturn(const LoginFormState(status: FormzStatus.valid));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );
      await tester.tap(find.byKey(LoginButton.buttonKey));
      verify(() => getIt<LoginFormBloc>().add(const LoginFormSubmitted()))
          .called(1);
    });

    testWidgets('shows error text message when status is submission failure',
        (tester) async {
      final ERouteInformationParser _routeInformationParser =
          ERouteInformationParser();
      final ERouterDelegate _routerDelegate = ERouterDelegate(
          cubit: NavigationCubit([PageConfig(location: '/login')]));

      when(() => getIt<LoginFormBloc>().state).thenReturn(const LoginFormState(
          status: FormzStatus.submissionFailure, error: 'Missing password'));

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );
      await tester.pump();
      expect(find.byKey(TextError.textKey), findsOneWidget);
    });
  });
}
