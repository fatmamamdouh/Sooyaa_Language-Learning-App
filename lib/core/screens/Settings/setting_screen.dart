import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Containers/discount_card.dart';
import '../../customs/Containers/setting_item.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';
import '../../resources/text_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.settingsHeader, style: AppTextStyle.style20),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h, top: 8.0.h),
                  child: Container(
                    height: 2.h,
                    color: const Color(0xffF2F2F2),
                    width: double.infinity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.accountText, style: AppTextStyle.baloo18),
                  ],
                ),
                SizedBox(height: 8.0.h),
                SettingItem(
                  propertyName: AppTexts.nameText,
                  propertyValue: "Text",
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppTexts.avatarText,
                          style: AppTextStyle.style16.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 16.0.r,
                          child: Image.asset(AppImages.friends),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0.h, top: 8.0.h),
                      child: Container(
                        height: 2.h,
                        color: const Color(0xffF2F2F2),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                SettingItem(
                  propertyName: AppTexts.email,
                  propertyValue: "username@gmail.com",
                ),
                SettingItem(
                  propertyName: AppTexts.iSpeakText,
                  propertyValue: "Russian",
                ),
                SettingItem(
                  propertyName: AppTexts.planOfEducation,
                  propertyValue: "Free",
                ),
                CustomBtn(
                  title: AppTexts.languageLevelTestButton,
                  hidden: false,
                  onTap: () {},
                  isLoading: false,
                ),
                const DiscountCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.generalText, style: AppTextStyle.baloo18),
                  ],
                ),
                SizedBox(height: 8.0.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppTexts.notificationText,
                          style: AppTextStyle.style16.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.white,
                          activeTrackColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0.h, top: 8.0.h),
                      child: Container(
                        height: 2.h,
                        color: const Color(0xffF2F2F2),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                SettingItem(
                  propertyName: AppTexts.interfaceLanguage,
                  propertyValue: "English",
                ),
                SettingItem(
                  propertyName: AppTexts.supportText,
                  propertyValue: "Contact us",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.logOut,
                      style: AppTextStyle.style16.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppTexts.clearLessonsDate,
                              style: AppTextStyle.style16.copyWith(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "669.6kb",
                              style: AppTextStyle.style16.copyWith(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0.h,
                        ),
                        Text(
                          AppTexts.clearLessonsDescription,
                          style: AppTextStyle.style14,
                        ),
                        SizedBox(
                          height: 8.0.h,
                        ),
                        CustomBtn(
                          title: AppTexts.clearButtonText,
                          hidden: false,
                          onTap: () {},
                          isLoading: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
