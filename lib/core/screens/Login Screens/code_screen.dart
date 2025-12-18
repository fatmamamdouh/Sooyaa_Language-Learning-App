import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_pro/core/cubit/login/forget%20pass/forget_pass_state.dart';
import 'package:sooyaa_pro/core/screens/Login%20Screens/widget/message_success.dart';
import '../../cubit/Validator/validator.dart';
import '../../cubit/login/forget pass/foget_pass_cubit.dart';
import '../../customs/AppBar/icons_app_bar.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Snackbar/custom_snack_bar.dart';
import '../../customs/TextFields/custom_textfield.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool hidden = true;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FogetPassCubit(),
      child: Scaffold(
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
                      child: BlocConsumer<FogetPassCubit, ForgetPassState>(
                        listener: (context, state) {
                          if (state is ForgetPassSuccess) {
                            setState(() {
                              hidden = false;
                            });
                          }
                          if (state is ForgetPassFailure) {
                            showErrorSnackBar(context, state.errMessage, true);
                            setState(() {
                              hidden = true;
                            });
                          }
                        },
                        builder: (context, state) {
                          return CustomBtn(
                            title: AppTexts.sendBtn,
                            onTap: state is ForgetPassLoading || !hidden
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<FogetPassCubit>()
                                          .forgotPassword(
                                            emailController.text,
                                          );
                                    }
                                  },
                            hidden: !hidden,
                            isLoading: state is ForgetPassLoading,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 120.h),
                  hidden
                      ? Container()
                      : MessageSuccess(resend: () {
                          setState(() {
                            hidden = true;
                          });
                        }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
