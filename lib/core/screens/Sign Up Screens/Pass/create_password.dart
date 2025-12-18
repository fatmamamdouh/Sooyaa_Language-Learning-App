import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubit/register/register_cubit.dart';
import '../../../cubit/register/register_state.dart';
import '../../../customs/Buttons/custom_btn.dart';
import '../../../customs/Snackbar/custom_snack_bar.dart';
import '../../../screens/Sign%20Up%20Screens/Pass/widget/con_pass_textfield.dart';
import '../../../screens/Sign%20Up%20Screens/Pass/widget/pass_textfield.dart';
import '../../../cubit/password/pass_cubit.dart';
import '../../../customs/AppBar/icons_app_bar.dart';
import '../../../resources/app_images.dart';
import '../../../resources/app_texts.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
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
                    AppTexts.passTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppTexts.pass,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10.h),
                  PassTextfield(
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppTexts.conPass,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10.h),
                  ConPassTextfield(
                    conPassController: conPassController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppTexts.passRules,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 310.h),
                  Center(
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.pushNamed(context, 'success');
                        }
                        if (state is AuthFailure) {
                          showErrorSnackBar(context, state.error, true);
                        }
                      },
                      builder: (context, state) {
                        return CustomBtn(
                          hidden: false,
                          title: AppTexts.continueBtn,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().setPassword(
                                    passwordController.text,
                                  );

                              context.read<AuthCubit>().register();
                            }
                          },
                          isLoading: state is AuthLoading,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
