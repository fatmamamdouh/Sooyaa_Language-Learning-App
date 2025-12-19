import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';
import '../../cubit/Tab/tab_cubit.dart';
import '../../customs/AppBar/learning_progress.dart';
import '../../customs/AppBar/top_bar.dart';
import '../../customs/Buttons/level_drop_down.dart';
import '../../customs/Containers/lesson_items.dart';
import '../../customs/Containers/tab.dart';
import '../../model/lesson_model.dart';
import '../../resources/app_images.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final double progress = 0.5;
  final List<LessonModel> listening = [
    LessonModel(
      title: "We're going on vacation",
      image: AppImages.advanced,
      isUnlocked: true,
    ),
    LessonModel(
      title: "Description of travel experiences",
      image: AppImages.advanced,
    ),
    LessonModel(
      title: "Discussing types of vacation",
      image: AppImages.advanced,
    ),
    LessonModel(
      title: "Trip planning",
      image: AppImages.advanced,
    ),
    LessonModel(
      title: "Developing speaking and listening",
      image: AppImages.advanced,
    ),
  ];

  final List<LessonModel> grammar = [
    LessonModel(
      title: "Discussing types of vacation",
      image: AppImages.advanced,
    ),
    LessonModel(
      title: "Trip planning",
      image: AppImages.advanced,
    ),
    LessonModel(
      title: "Developing speaking and listening",
      image: AppImages.advanced,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabCubit(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(),

            SizedBox(height: 10.h),
            LevelDropDown(),
            SizedBox(height: 10.h),
            LearningProgress(progress: progress),

            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Center(
                child: Image.asset(
                  AppImages.premium,
                  width: 360.w,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /// Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: BlocBuilder<TabCubit, int>(
                builder: (context, selectedIndex) {
                  final tabs = [
                    "Listening",
                    "Grammar",
                    "Vocabulary",
                    "Stories"
                  ];
                  return SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        return tab(
                          title: tabs[index],
                          active: selectedIndex == index,
                          context: context,
                          onTap: () {
                            context.read<TabCubit>().changeTab(index);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chapter - 1",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "Traveling",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<TabCubit, int>(
                builder: (context, selectedIndex) {
                  final List<List<LessonModel>> tabLessons = [
                    listening,
                    grammar,
                    [],
                    []
                  ];
                  final currentLessons = tabLessons[selectedIndex];

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    itemCount: currentLessons.length,
                    itemBuilder: (context, index) {
                      return LessonItems(
                        lesson: currentLessons[index],
                        index: index,
                        lessons: currentLessons,
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),
            Center(
              child: CustomBtn(
                title: AppTexts.learnBtn,
                isLoading: false,
                hidden: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
