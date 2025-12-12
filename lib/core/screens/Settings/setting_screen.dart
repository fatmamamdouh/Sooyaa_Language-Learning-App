import 'package:flutter/material.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/Containers/discount_card.dart';
import 'package:sooyaa_app/core/customs/Containers/setting_item.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';
import 'package:sooyaa_app/core/resources/text_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.settingsHeader, style: AppTextStyle.style20),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Container(
                    height: 2,
                    color: Color(0xffF2F2F2),
                    width: double.infinity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.accountText, style: AppTextStyle.baloo18),
                  ],
                ),
                SizedBox(height: 8.0),
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
                        Spacer(),
                        CircleAvatar(
                          radius: 16.0,
                          child: Image.asset(AppImages.friends),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                      child: Container(
                        height: 2,
                        color: Color(0xffF2F2F2),
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
                ),
                DiscountCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppTexts.generalText, style: AppTextStyle.baloo18),
                  ],
                ),
                SizedBox(height: 8.0),
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
                        Spacer(),
                        Switch(value: true, onChanged: (value){}, activeColor: AppColors.white, activeTrackColor: AppColors.primaryColor,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                      child: Container(
                        height: 2,
                        color: Color(0xffF2F2F2),
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
                    borderRadius: BorderRadius.circular(12.0),
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
                            Spacer(),
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
                          height: 8.0,
                        ),
                        Text(
                          AppTexts.clearLessonsDescription,
                          style: AppTextStyle.style14,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        CustomBtn(
                          title: AppTexts.clearButtonText,
                          hidden: false,
                          onTap: () {},
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
