import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class LearningProgress extends StatelessWidget {
  final double progress;
  const LearningProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 8.h,
            width: width - 32.w,
            decoration: BoxDecoration(
              color: AppColors.grey5,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: (width - 32) * progress - 18.w,
            child: Container(
              height: 20.h,
              width: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "${(progress * 100).toInt()}%",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.white,
                      fontSize: 11.sp,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
