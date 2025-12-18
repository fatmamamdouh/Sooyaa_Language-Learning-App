import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class LearnBtn extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  const LearnBtn({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: AppColors.grey5,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: AppColors.primaryColor),
            Text(text, style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
