import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';
import '../../resources/text_style.dart';
import '../Buttons/custom_btn.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey5,
          borderRadius: BorderRadius.circular(12.0.r),
          image: DecorationImage(
            image: AssetImage(AppImages.discountIcon),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0.w),
                child: CustomBtn(title: AppTexts.sevenDaysFree, hidden: false, onTap: () {}),
              ),
              SizedBox(height: 16.0.h),
              Text(
                AppTexts.tryPremiumFree,
                style: AppTextStyle.style20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
