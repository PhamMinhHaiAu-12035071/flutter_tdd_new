import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:formz/formz.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  static const Key buttonKey =
      ValueKey('loginForm_submitButton_elevatedButton');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: LoginButton.buttonKey,
          onPressed: state.status.isValidated
              ? () {
                  context.read<LoginFormBloc>().add(const LoginFormSubmitted());
                }
              : null,
          child: const Text('Submit'),
        );
      },
    );
  }
}
