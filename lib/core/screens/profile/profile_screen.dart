import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../customs/AppBar/profile_app_bar.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Buttons/learn_btn.dart';
import '../../customs/Containers/day_container.dart';
import '../../customs/Containers/profile_detials.dart';
import '../../resources/app_images.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_texts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            const ProfileAppBar(),
            const ProfileDetials(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Image(
                  image: AssetImage(AppImages.english),
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "English",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                Text(
                  'British',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.grey),
                ),
              ],
            ),
            Divider(color: AppColors.grey, height: 2.h),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: Image(image: AssetImage(AppImages.cat), height: 50.h),
            ),
            CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 15,
              percent: 0.5,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("50 %", style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              progressColor: AppColors.primaryColor,
              backgroundColor: AppColors.grey5,
            ),
            SizedBox(height: 10.h),
            Text(
              "Language Knowledge",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LearnBtn(
                  text: "Words Learned",
                  icon: Icons.translate,
                  onTap: () => Navigator.pushNamed(context, "wordsLearned"),
                ),
                const LearnBtn(
                  text: "Lessons Saved",
                  icon: Icons.language_rounded,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Divider(
              color: AppColors.grey,
              height: 2.h,
            ),
            SizedBox(height: 20.h),
            CustomBtn(
              title: AppTexts.languageLevelTestButton,
              isLoading: false,
              hidden: false,
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Study days",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(height: 10.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DayContainer(day: "Mo"),
                DayContainer(day: "Tu"),
                DayContainer(day: "We"),
                DayContainer(day: "Th"),
                DayContainer(day: "Fr"),
                DayContainer(day: "Sa"),
                DayContainer(day: "Su"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
