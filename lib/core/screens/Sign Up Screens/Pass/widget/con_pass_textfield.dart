import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/Validator/validator.dart';
import '../../../../cubit/password/pass_cubit.dart';
import '../../../../cubit/password/pass_state.dart';
import '../../../../customs/TextFields/custom_textfield.dart';
import '../../../../resources/app_texts.dart';

class ConPassTextfield extends StatelessWidget {
  final TextEditingController conPassController;
  final TextEditingController passwordController;
  const ConPassTextfield({
    super.key,
    required this.conPassController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PasswordCubit, PasswordState, bool>(
      selector: (state) => state.isConPassVisible,
      builder: (context, isVisible) {
        return CustomTextfield(
          hint: AppTexts.passHint,
          controller: conPassController,
          keyboardType: TextInputType.visiblePassword,
          obscure: !isVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              context.read<PasswordCubit>().toggleConPass();
            },
          ),
          validator: (validator) => Validator.validatePassConf(
            conPass: validator!,
            passController: passwordController.text,
          ),
        );
      },
    );
  }
}
