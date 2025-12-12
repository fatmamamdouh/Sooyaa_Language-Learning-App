import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/text_style.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final Widget? suffixIcon;
  const CustomTextfield({
    super.key,
    required this.hint,
    this.keyboardType,
    this.controller,
    this.validator,
    this.obscure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscure,
        cursorColor: Theme.of(context).primaryColor,
        style: AppTextStyle.style16.copyWith(color: AppColors.primaryColor),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,
          filled: true,
          contentPadding: EdgeInsetsDirectional.all(15.w),
          fillColor: AppColors.fillColor,
          errorStyle: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.red),
          hintStyle: AppTextStyle.style16.copyWith(color: AppColors.hintColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
