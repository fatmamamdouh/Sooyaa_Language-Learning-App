import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_app/core/cubit/selection/selection_cubit.dart';
import 'package:sooyaa_app/core/cubit/selection/selection_state.dart';
import 'package:sooyaa_app/core/customs/AppBar/select_app_bar.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/Containers/select_container.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';

class SelectLanguageScreen extends StatelessWidget {
  SelectLanguageScreen({super.key});

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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80.h),
          SelectAppBar(
            image: AppImages.cat,
            title: AppTexts.selectLunguageTitle,
          ),
          SizedBox(height: 10.h),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: languages.length,
                separatorBuilder: (_, __) => SizedBox(height: 30.h),
                itemBuilder: (context, index) {
                  bool isSelected = state.selectedLanguageIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectContainer(
                      onTap: () => context
                          .read<SelectionCubit>()
                          .selectLanguage(index, languages[index]),
                      title: languages[index],
                      image: flags[index],
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
              bool isEnabled = state.selectedLanguageIndex != null;

              return CustomBtn(
                title: AppTexts.continueBtn,
                hidden: !isEnabled,
                onTap: () {
                  if (state.selectedLanguage == null) return;
                  Navigator.pushNamed(context, "levels");
                },
                isLoading: false,
              );
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
