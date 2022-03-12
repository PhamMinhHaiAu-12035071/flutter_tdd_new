import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_new/modules/auth/login/business_logic/bloc/login_form_bloc.dart';
import 'package:formz/formz.dart';

class TextError extends StatelessWidget {
  const TextError({Key? key}) : super(key: key);
  static const Key textKey = ValueKey('textError_message');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status.isSubmissionFailure) {
            return Text(
              state.error,
              key: TextError.textKey,
              style: const TextStyle(color: Colors.red),
            );
          }
          return Container();
        });
  }
}
