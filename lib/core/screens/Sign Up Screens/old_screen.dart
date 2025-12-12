import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/cubit/selection/selection_cubit.dart';
import 'package:sooyaa_app/core/cubit/selection/selection_state.dart';
import 'package:sooyaa_app/core/customs/AppBar/select_app_bar.dart';
import 'package:sooyaa_app/core/customs/Buttons/custom_btn.dart';
import 'package:sooyaa_app/core/customs/Containers/select_container.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';
import 'package:sooyaa_app/core/resources/app_texts.dart';

class OldScreen extends StatelessWidget {
  OldScreen({super.key});

  final List<String> olds = [
    "From 13 to 17 years old",
    "From 18 to 24 years old",
    "From 25 to 34 years old",
    "From 35 to 44 years old",
    "From 45 to 54 years old",
    "From 55 to 64 years old",
    "65+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectTwoAppBar(
        context: context,
        image: AppImages.oldBar,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return SelectAppBar(
                image: AppImages.catOld,
                title: "How old are you?",
              );
            },
          ),
          SizedBox(height: 20.h),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: olds.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  bool isSelected = state.selectedOldIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectContainer(
                      onTap: () => context
                          .read<SelectionCubit>()
                          .selectOld(index, olds[index]),
                      title: olds[index],
                      image: AppImages.fifteen,
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
              bool isEnabled = state.selectedOldIndex != null;

              return CustomBtn(
                title: AppTexts.continueBtn,
                hidden: !isEnabled,
                onTap: () {},
              );
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
