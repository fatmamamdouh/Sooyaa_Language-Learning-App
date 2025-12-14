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

class WhyScreen extends StatelessWidget {
  WhyScreen({super.key});

  final List<String> reason = [
    "Career",
    "Education",
    "Fun and culture",
    "Daily",
    "Travel",
    "Friends and family",
  ];

  final List images = [
    AppImages.career,
    AppImages.education,
    AppImages.fun,
    AppImages.daily,
    AppImages.travel,
    AppImages.friends,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectTwoAppBar(
        context: context,
        image: AppImages.reasonBar,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return SelectAppBar(
                image: AppImages.successIcon,
                title: "Why do you want to learn ${state.selectedLanguage}?",
              );
            },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reason.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  bool isSelected = state.selectedWhyIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectContainer(
                      onTap: () => context
                          .read<SelectionCubit>()
                          .selectWhy(index, reason[index]),
                      title: reason[index],
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
              bool isEnabled = state.selectedWhyIndex != null;

              return CustomBtn(
                isLoading: false,
                title: AppTexts.continueBtn,
                hidden: !isEnabled,
                onTap: () {
                  if (state.selectedWhyIndex == null) return;

                  Navigator.pushNamed(context, 'zone');
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
