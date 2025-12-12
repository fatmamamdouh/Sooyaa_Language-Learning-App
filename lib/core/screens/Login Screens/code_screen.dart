import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/cubit/Validator/validator.dart';
import 'package:sooyaa_app/core/customs/AppBar/icons_app_bar.dart';
import 'package:sooyaa_app/core/customs/Buttons/account_ask.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/TextFields/custom_textfield.dart';
import 'package:sooyaa_app/core/customs/TextFields/otp.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool hidden = true;

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: iconsAppBar(context: context, image: AppImages.forget),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.enterEmail,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10.h),
                Text(
                  "We will send you a code",
                  style: Theme.of(context).textTheme.bodySmall,
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
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 180.w,
                    child: CustomBtn(
                      title: AppTexts.sendBtn,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            hidden = false;
                          });
                        }
                      },
                      hidden: false,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                hidden
                    ? Container()
                    : Form(
                        key: _otpFormKey,
                      child: Column(
                          children: [
                            Otp(controller: otpController,
                                validator: (validator) =>
                                    Validator.validateOtp(otp: validator!)),
                            SizedBox(height: 20.h),
                            AccountAsk(
                              ask: "Dont recive any code? ",
                              askBtn: "Resend",
                              align: MainAxisAlignment.start,
                              onTap: () {},
                            ),
                            SizedBox(
                              height: 200.h,
                            ),
                            Center(
                              child: CustomBtn(
                                title: AppTexts.continueBtn,
                                onTap: () {
                                  if (_otpFormKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, "createNewPassword");
                                  }
                                },
                                hidden: false,
                              ),
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

