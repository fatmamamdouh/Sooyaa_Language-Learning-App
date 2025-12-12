import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/customs/AppBar/lessons_app_bar.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/Containers/lesson_card.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';
import 'package:sooyaa_app/core/resources/text_style.dart';

class FirstLessonScreen extends StatelessWidget {
  const FirstLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessonsAppBar(),
              Padding(
                padding: EdgeInsets.only(top: 4.0.h, bottom: 8.0.h),
                child: Divider(
                  color: AppColors.fillColor,
                  height: 2.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(AppTexts.aboutTheLesson, style: AppTextStyle.baloo18.copyWith(fontSize: 20.0),),
              ),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: LessonVideoCard(
                    videoUrl: "https://youtu.be/FtBzf8VgSUU",
                    thumbnailUrl: "https://storage.renderlion.com/hubImages/ai-video-maker-113/step-1.png",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(AppTexts.videoScreenQuestions, style: AppTextStyle.style20,),
              ),
              Spacer(),
              Center(child: CustomBtn(title: AppTexts.continueBtn, hidden: false,)),
            ],
          ),
        ),
      ),
    );


  }
}


