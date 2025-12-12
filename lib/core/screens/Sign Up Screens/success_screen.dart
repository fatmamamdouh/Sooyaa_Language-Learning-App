import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/Containers/welcome_container.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150.h),
          WelcomeContainer(title: AppTexts.successMessage),
          SizedBox(height: 10.h),
          Image(
            image: AssetImage(AppImages.successIcon),
            height: 112.h,
            width: 80.w,
          ),
          const Spacer(),
          CustomBtn(
            title: AppTexts.letsGo,
            onTap: () => Navigator.pushNamed(context, "selectLunguage"),
            hidden: false,
          ),
          SizedBox(height: 40.h),
        ],
      )),
    );
  }
}
