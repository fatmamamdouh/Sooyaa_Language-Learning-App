import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/text_style.dart';

ThemeData lightTheme({required BuildContext context}) => ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        actionsPadding: EdgeInsetsDirectional.only(end: 20.w),
        centerTitle: true,
        toolbarHeight: 100.h,
      ),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: TextTheme(
        displayMedium: AppTextStyle.baloo18,
        displaySmall: AppTextStyle.style13,
        bodyLarge: AppTextStyle.style32,
        bodyMedium: AppTextStyle.baloo24,
        bodySmall: AppTextStyle.style16,
        labelMedium: AppTextStyle.baloo16,
        labelSmall: AppTextStyle.baloo13,
      ),
    );
