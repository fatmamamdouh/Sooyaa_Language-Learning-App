import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/selection/selection_cubit.dart';
import '../../cubit/selection/selection_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';


class TopBar extends StatelessWidget {
  TopBar({super.key});

  final List<String> languages = [
    'English',
    'Spanish',
    'Italian',
    'French',
  ];

  final List<String> flags = [
    AppImages.english,
    AppImages.spanish,
    AppImages.italian,
    AppImages.french
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        final cubit = context.read<SelectionCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final selected = await showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(70.w, 80.h, 200.w, 200.h),
                    items: List.generate(
                      languages.length,
                      (i) => PopupMenuItem(
                        value: i,
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(flags[i]),
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(languages[i]),
                          ],
                        ),
                      ),
                    ),
                  );

                  if (selected != null) {
                    cubit.selectLanguage(selected, languages[selected]);
                  }
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: AssetImage(
                        flags[state.selectedLanguageIndex!],
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.w,
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    size: 20.w,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.star_border,
                    size: 20.w,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "0/20",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.bookmark_border,
                    size: 20.w,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.notifications_none,
                    size: 20.w,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
