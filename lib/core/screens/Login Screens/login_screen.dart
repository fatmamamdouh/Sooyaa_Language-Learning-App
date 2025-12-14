import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/Validator/validator.dart';
import '../../cubit/password/pass_cubit.dart';
import '../../cubit/password/pass_state.dart';
import '../../customs/AppBar/sign_app_bar.dart';
import '../../customs/Buttons/account_ask.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Buttons/google_btn.dart';
import '../../customs/TextFields/custom_textfield.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: Scaffold(
        appBar: signAppBar(context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    AppTexts.loginLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppTexts.email,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextfield(
                    hint: AppTexts.emailHint,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (validator) =>
                        Validator.validateEmail(email: validator!),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppTexts.pass,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
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
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        "code",
                      ),
                      child: Text(
                        AppTexts.forgetPass,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomBtn(
                    isLoading: false,
                      hidden: false,
                      title: AppTexts.login,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "createPassword");
                        }
                      }),
                  SizedBox(height: 20.h),
                  Image(image: AssetImage(AppImages.divider)),
                  SizedBox(height: 20.h),
                  SignBtn(
                    title: AppTexts.googleLogin,
                    onTap: () {},
                    image: AppImages.google,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppTexts.signUptrailing,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey),
                  ),
                  SizedBox(height: 70.h),
                  AccountAsk(
                    ask: AppTexts.dontHaveAnAccount,
                    askBtn: AppTexts.signUp,
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      "signUpWithEmail",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
