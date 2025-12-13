import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../resources/app_colors.dart';

class Otp extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const Otp({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        length: 6,
        controller: controller,
        validator: validator,
        errorPinTheme: PinTheme(
          width: 50.w,
          height: 56.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
        errorTextStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: AppColors.red),
        defaultPinTheme: PinTheme(
          width: 50.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.fillColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: Theme.of(context).textTheme.displayMedium,
        ),
        focusedPinTheme: PinTheme(
          width: 50.w,
          height: 56.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.welcomeContainerColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
