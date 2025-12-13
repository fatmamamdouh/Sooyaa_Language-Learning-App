import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

Widget tab({
  required String title,
  required bool active,
  required BuildContext context,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.h,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active ? AppColors.primaryColor : AppColors.grey5,
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: active ? AppColors.primaryColor : AppColors.grey5,
            ),
      ),
    ),
  );
}
