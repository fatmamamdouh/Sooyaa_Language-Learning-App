import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/Validator/validator.dart';
import '../../customs/AppBar/sign_app_bar.dart';
import '../../customs/Buttons/account_ask.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Buttons/google_btn.dart';
import '../../customs/TextFields/custom_textfield.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signAppBar(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  AppTexts.signUpLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 40.h),
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
                SizedBox(height: 20.h),
                CustomBtn(
                  isLoading: false,
                    hidden: false,
                    title: AppTexts.continueBtn,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "name");
                      }
                    }),
                SizedBox(height: 30.h),
                Image(image: AssetImage(AppImages.divider)),
                SizedBox(height: 20.h),
                SignBtn(
                  title: AppTexts.googleSignUp,
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
                SizedBox(height: 150.h),
                AccountAsk(
                  ask: AppTexts.haveAnAccount,
                  askBtn: AppTexts.login,
                  onTap: () => Navigator.pushReplacementNamed(context, "login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
