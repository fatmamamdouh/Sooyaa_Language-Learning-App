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

class ZoneScreen extends StatelessWidget {
  ZoneScreen({super.key});

  final List<String> zones = [
    "5 min",
    "10 min",
    "15 min",
    "20 min",
  ];
  final List<String> images = [
    AppImages.five,
    AppImages.ten,
    AppImages.fifteen,
    AppImages.twenty,
  ];

  final List<String> trailing = [
    "Casual",
    "Regular",
    "Accelerated",
    "Intense",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectTwoAppBar(
        context: context,
        image: AppImages.zoneBar,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return SelectAppBar(
                image: AppImages.catZone,
                title: "What is your daily goal for practicing?",
              );
            },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: zones.length,
                separatorBuilder: (_, __) => SizedBox(height: 30.h),
                itemBuilder: (context, index) {
                  bool isSelected = state.selectedZoneIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectContainer(
                      onTap: () => context
                          .read<SelectionCubit>()
                          .selectZone(index, zones[index]),
                      title: zones[index],
                      image: images[index],
                      trailing: trailing[index],
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
              bool isEnabled = state.selectedZoneIndex != null;

              return CustomBtn(
                title: AppTexts.continueBtn,
                hidden: !isEnabled,
                onTap: () {
                  if (state.selectedZoneIndex == null) return;
                  Navigator.pushNamed(context, "old");
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
