import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';
import '../../resources/text_style.dart';

class PlanFeature extends StatelessWidget {
  const PlanFeature({super.key, required this.featureTitle, required this.featureDesc, required this.image});

  final String featureTitle;
  final String featureDesc;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 14.0.r,
              backgroundColor: AppColors.grey5,
              child: Image.asset(image),
            ),
          ],
        ),
        SizedBox(width: 10.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                featureTitle,
                style: AppTextStyle.style20.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4.0.h),
              Text(
                featureDesc,
                style: AppTextStyle.style16,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h,),
      ],
    );
  }
}
