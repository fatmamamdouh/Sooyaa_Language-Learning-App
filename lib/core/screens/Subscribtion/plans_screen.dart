import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Containers/free_plan_item.dart';
import '../../customs/Containers/plan_feature.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';
import '../../resources/text_style.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.w),
          child: Column(
            children: [
              Text(
                AppTexts.plansTitle,
                style: AppTextStyle.style24,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                child: Image.asset(
                  AppImages.rateCard,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.fillColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        AppTexts.premiumPlanQuestion,
                        style: AppTextStyle.style20.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      PlanFeature(
                        featureTitle: AppTexts.premiumFirst,
                        featureDesc: AppTexts.premiumFirstDesc,
                        image: AppImages.playIcon,
                      ),
                      PlanFeature(
                        featureTitle: AppTexts.premiumSecond,
                        featureDesc: AppTexts.premiumSecondDesc,
                        image: AppImages.noAdIcon,
                      ),
                      PlanFeature(
                        featureTitle: AppTexts.premiumThird,
                        featureDesc: AppTexts.premiumThirdDesc,
                        image: AppImages.innovationIcon,
                      ),
                      PlanFeature(
                        featureTitle: AppTexts.premiumFourth,
                        featureDesc: AppTexts.premiumFourthDesc,
                        image: AppImages.feedbackIcon,
                      ),
                      PlanFeature(
                        featureTitle: AppTexts.premiumFifth,
                        featureDesc: AppTexts.premiumFifthDesc,
                        image: AppImages.premiumIcon,
                      ),
                      PlanFeature(
                        featureTitle: AppTexts.premiumSixth,
                        featureDesc: AppTexts.premiumFifthDesc,
                        image: AppImages.certificateIcon,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.fillColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        AppTexts.premiumPlanQuestion,
                        style: AppTextStyle.style20.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      FreePlanItem(
                        time: AppTexts.nowText,
                        title: AppTexts.freeTrialNow,
                        desc: AppTexts.freeSevenDays,
                      ),
                      FreePlanItem(
                        time: AppTexts.day5Text,
                        title: AppTexts.fifthDayTitle,
                        desc: AppTexts.fifthDayDesc,
                      ),
                      FreePlanItem(
                        time: AppTexts.day7Text,
                        title: AppTexts.seventhDayTitle,
                        desc: AppTexts.seventhDayDesc,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                child: Text(AppTexts.restorePurchaseText,
                    style: AppTextStyle.style16underline),
              ),
              Divider(
                height: 2.h,
                color: AppColors.grey5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: CustomBtn(
                  isLoading: false,
                  title: AppTexts.tryFree,
                  hidden: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
