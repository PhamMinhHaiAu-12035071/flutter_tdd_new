import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/models/password.dart';
import 'package:formz/formz.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);
  static const Key passwordKey = ValueKey('loginForm_passwordInput_textField');

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          _controller.text = ''; // clear data
        }
      },
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: PasswordInput.passwordKey,
          controller: _controller,
          onChanged: (String password) => context.read<LoginFormBloc>().add(
                LoginFormPasswordChanged(password: password),
              ),
          decoration: InputDecoration(
              icon: const Icon(Icons.lock),
              labelText: 'Password',
              errorText: state.password.invalid
                  ? (state.password.error == PasswordValidateError.empty
                      ? 'Password '
                          'is not empty'
                      : null)
                  : null,),
          obscureText: true,
        );
      },
    );
  }
}
