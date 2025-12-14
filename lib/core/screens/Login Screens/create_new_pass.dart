import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/Validator/validator.dart';
import '../../cubit/password/pass_cubit.dart';
import '../../cubit/password/pass_state.dart';
import '../../customs/AppBar/icons_app_bar.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/TextFields/custom_textfield.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';


class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPassController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    conPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PasswordCubit(),
        child: Scaffold(
          appBar: iconsAppBar(context: context, image: AppImages.cat),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.newPassTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppTexts.newPass,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 10.h),
                    BlocSelector<PasswordCubit, PasswordState, bool>(
                      selector: (state) => state.isPassVisible,
                      builder: (context, isVisible) {
                        return CustomTextfield(
                          hint: AppTexts.passHint,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscure: !isVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              context.read<PasswordCubit>().togglePass();
                            },
                          ),
                          validator: (validator) =>
                              Validator.validatePass(password: validator!),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppTexts.conNewPass,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 10.h),
                    BlocSelector<PasswordCubit, PasswordState, bool>(
                      selector: (state) => state.isConPassVisible,
                      builder: (context, isVisible) {
                        return CustomTextfield(
                          hint: AppTexts.passHint,
                          controller: conPassController,
                          keyboardType: TextInputType.visiblePassword,
                          obscure: !isVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppTexts.passRules,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 320.h),
                    CustomBtn(
                      isLoading: false,
                      title: AppTexts.continueBtn,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "success");
                        }
                      },
                      hidden: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),);
  }
}
