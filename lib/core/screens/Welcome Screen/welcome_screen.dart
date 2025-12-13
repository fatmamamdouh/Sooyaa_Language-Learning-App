import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../customs/Buttons/account_ask.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Containers/welcome_container.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100.h),
          WelcomeContainer(title: AppTexts.welcomeTextOne),
          Center(
            child: Image(
              image: AssetImage(AppImages.cats),
              height: 200.h,
              width: 300.w,
            ),
          ),
          const Spacer(),
          Text(
            AppTexts.welcomeTextTwo,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 20.h),
          CustomBtn(
              hidden: false,
              title: AppTexts.letsGo,
              onTap: () => Navigator.pushNamed(context, "signUpWithEmail")),
          SizedBox(height: 20.h),
          AccountAsk(
            ask: AppTexts.haveAnAccount,
            askBtn: AppTexts.login,
            onTap: () => Navigator.pushNamed(context, "login"),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
