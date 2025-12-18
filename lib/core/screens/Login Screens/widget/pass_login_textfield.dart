import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/Validator/validator.dart';
import '../../../cubit/password/pass_cubit.dart';
import '../../../cubit/password/pass_state.dart';
import '../../../customs/TextFields/custom_textfield.dart';
import '../../../resources/app_texts.dart';

class PassLoginTextfield extends StatelessWidget {
  final TextEditingController passwordController;
  const PassLoginTextfield({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PasswordCubit, PasswordState, bool>(
      selector: (state) => state.isPassVisible,
      builder: (context, isVisible) {
        return CustomTextfield(
          hint: AppTexts.passHint,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscure: !isVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              context.read<PasswordCubit>().togglePass();
            },
          ),
          validator: (validator) =>
              Validator.validatePass(password: validator!),
        );
      },
    );
  }
}
