import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class ProfileDetials extends StatelessWidget {
  const ProfileDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 60.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.person, color: AppColors.white, size: 40.w),
      ),
      title: Text("John Doe", style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text(
        "intermediate",
        style: Theme.of(context).textTheme.displaySmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppColors.grey5,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.notifications_none, size: 20.w),
            ),
          ),
        ],
      ),
    );
  }
}
