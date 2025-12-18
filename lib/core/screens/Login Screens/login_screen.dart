import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_pro/core/cubit/login/login_cubit.dart';
import 'package:sooyaa_pro/core/customs/Dialog/confirm_email_dialog.dart';
import 'package:sooyaa_pro/core/screens/Login%20Screens/widget/pass_login_textfield.dart';
import '../../cubit/Validator/validator.dart';
import '../../cubit/login/login_state.dart';
import '../../cubit/password/pass_cubit.dart';
import '../../customs/AppBar/sign_app_bar.dart';
import '../../customs/Buttons/account_ask.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Buttons/google_btn.dart';
import '../../customs/Snackbar/custom_snack_bar.dart';
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
                  PassLoginTextfield(
                    passwordController: passwordController,
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "selectLunguage",
                          (route) => false,
                        );
                      }
                      if (state is LoginEmailNotConfirmed) {
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmEmailDialog(
                            email: emailController.text,
                          ),
                        );
                      }
                      if (state is LoginFailure) {
                        showErrorSnackBar(context, state.message, true);
                      }
                    },
                    builder: (context, state) {
                      return CustomBtn(
                        hidden: false,
                        title: AppTexts.login,
                        onTap: state is LoginLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                }
                              },
                        isLoading: state is LoginLoading,
                      );
                    },
                  ),
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
