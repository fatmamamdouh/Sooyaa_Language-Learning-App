import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/selection/selection_cubit.dart';
import '../../cubit/selection/selection_state.dart';
import '../../customs/AppBar/select_app_bar.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/Containers/select_container.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';

class LevelScreen extends StatelessWidget {
  LevelScreen({super.key});

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
    return Scaffold(
      appBar: selectTwoAppBar(
        context: context,
        image: AppImages.levelBar,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return SelectAppBar(
                image: AppImages.catLevel,
                title: "How much ${state.selectedLanguage} do you know?",
              );
            },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: levels.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  bool isSelected = state.selectedLevelIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectContainer(
                      onTap: () => context
                          .read<SelectionCubit>()
                          .selectLevel(index, levels[index]),
                      title: levels[index],
                      image: images[index],
                      isSelected: isSelected,
                    ),
                  );
                },
              );
            },
          ),
          const Spacer(),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              bool isEnabled = state.selectedLevelIndex != null;

              return CustomBtn(
                title: AppTexts.continueBtn,
                hidden: !isEnabled,
                onTap: () {
                  if (state.selectedLevelIndex == null) return;

                  Navigator.pushNamed(context, "why");
                },
              );
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
