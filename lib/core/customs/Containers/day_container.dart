import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class DayContainer extends StatelessWidget {
  final String day;
  const DayContainer({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.grey5,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            Icons.check_circle_outline,
            size: 20.w,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          day,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
