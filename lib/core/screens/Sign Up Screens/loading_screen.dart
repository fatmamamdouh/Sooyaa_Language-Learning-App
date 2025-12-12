import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/customs/Containers/welcome_container.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (progress >= 100) {
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            "welcome",
            (route) => false,
          );
        });
      } else {
        setState(() {
          progress += 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double barWidth = (200.w).clamp(0, double.infinity);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AppImages.completed,
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(height: 60.h),
            const WelcomeContainer(
              title: "We're preparing your custom practice plan...",
            ),
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: barWidth,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.grey.withAlpha(25),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      Container(
                        height: 6,
                        width: (barWidth * (progress / 100)),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),

                // نسبة التحميل
                Text(
                  "${progress.toInt()}%",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            SizedBox(height: 60.h),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
