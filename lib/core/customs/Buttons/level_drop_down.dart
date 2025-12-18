import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/selection/selection_cubit.dart';
import '../../cubit/selection/selection_state.dart';
import '../../resources/app_images.dart';

class LevelDropDown extends StatelessWidget {
  LevelDropDown({super.key});

  final List levels = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];

  final List images = [
    AppImages.beginner,
    AppImages.intermediate,
    AppImages.advanced,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<SelectionCubit, SelectionState>(
        builder: (context, state) {
          final cubit = context.read<SelectionCubit>();
          return GestureDetector(
            onTap: () async {
              final selected = await showMenu(
                context: context,
                position: RelativeRect.fromLTRB(120.w, 130.h, 200.w, 200.h),
                items: List.generate(
                  levels.length,
                  (i) => PopupMenuItem(
                    value: i,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(images[i]),
                          height: 20.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(levels[i]),
                      ],
                    ),
                  ),
                ),
              );

              if (selected != null) {
                cubit.selectLevel(selected, levels[selected]);
              }
            },
            child: Row(
              children: [
                Text(
                  levels[state.selectedLevelIndex!],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.w,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
