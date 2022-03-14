import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/routers/e_page.dart';
import 'package:flutter_tdd_new/configs/routers/navigation_cubit.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/email_input.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/login_button.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/password_input.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/widgets/text_error.dart';
import 'package:formz/formz.dart';

class LoginScreen extends EPage {
  const LoginScreen({required Map<String, dynamic> args}) : super(args: args);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginFormBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const Key loadingKey = ValueKey('loginView_loading');

  void _showLoading(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CupertinoActivityIndicator(
                key: LoginView.loadingKey,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocListener<LoginFormBloc, LoginFormState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context).pop();
            context.read<NavigationCubit>().push('/');
          } else if (state.status.isSubmissionInProgress) {
            _showLoading(context);
          } else if (state.status.isSubmissionFailure) {
            Navigator.of(context).pop();
          }
        },
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    EmailInput(),
                    Padding(padding: EdgeInsets.all(12)),
                    PasswordInput(),
                    Padding(padding: EdgeInsets.all(12)),
                    LoginButton(),
                    Padding(padding: EdgeInsets.all(12)),
                    TextError(),
                    Padding(padding: EdgeInsets.all(12)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
