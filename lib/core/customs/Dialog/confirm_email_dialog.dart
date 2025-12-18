import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/login/confirm%20email/confirm_email_cubit.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../cubit/login/confirm email/confirm_email_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';

class ConfirmEmailDialog extends StatelessWidget {
  final String email;
  const ConfirmEmailDialog({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmEmailCubit(),
      child: AlertDialog(
        backgroundColor: AppColors.white,
        title: Image.asset(AppImages.cat, height: 60.h, width: 60.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Check your email",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 24.h),
            Text(
              "Plesse check your email in span to verify your account",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          BlocConsumer<ConfirmEmailCubit, ConfirmEmailState>(
            listener: (context, state) {
              if (state is ConfirmEmailSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return CustomBtn(
                title: "Resend",
                isLoading: state is ConfirmEmailLoading,
                hidden: false,
                onTap: state is ConfirmEmailLoading
                    ? null
                    : () =>
                        context.read<ConfirmEmailCubit>().confirmEmail(email),
              );
            },
          ),
        ],
      ),
    );
  }
}
