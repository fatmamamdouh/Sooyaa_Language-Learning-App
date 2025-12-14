import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool hidden;
  final bool isLoading;
  const CustomBtn({
    super.key,
    required this.title,
    this.onTap,
    required this.isLoading,
    required this.hidden,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isLoading? SizedBox(
        width: 315.w,
        height: 50.h,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.white,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ) : Container(
        width: 315.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hidden
                ? [AppColors.grey5, AppColors.grey5]
                : [AppColors.primaryColor, AppColors.secondaryColor],
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
