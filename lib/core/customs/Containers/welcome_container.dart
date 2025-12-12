import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';

class WelcomeContainer extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  const WelcomeContainer({
    super.key,
    required this.title,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 80.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.welcomeContainerColor.withAlpha(25),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        title,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
