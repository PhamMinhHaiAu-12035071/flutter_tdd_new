import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.test)
@Singleton(as: LoginFormBloc)
class MockLoginFormBloc extends MockBloc<LoginFormEvent, LoginFormState>
    implements LoginFormBloc {}
