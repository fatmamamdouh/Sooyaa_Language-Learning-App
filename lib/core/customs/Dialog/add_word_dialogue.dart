import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/word_learned/word_learned_cubit.dart';
import '../../cubit/word_learned/word_learned_states.dart';
import '../Buttons/custom_btn.dart';
import '../Snackbar/custom_snack_bar.dart';
import '../TextFields/custom_textfield.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';
import '../../resources/text_style.dart';

class AddWordDialogue extends StatelessWidget {
  const AddWordDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: BlocBuilder<WordLearnedCubit, WordLearnedStates>(
        builder: (context, state) => Form(
          key: WordLearnedCubit.get(context).formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.cat, height: 60.h, width: 60.w),
              SizedBox(height: 20.h),
              Text(
                AppTexts.soyaWithYou,
                style: AppTextStyle.style20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextfield(
                hint: "Arabic Word",
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "can't be empty";
                  } else
                  {
                    return null;
                  }
                },
                controller: WordLearnedCubit.get(context).wordController,
              ),
              SizedBox(height: 24.h),
              CustomTextfield(
                hint: "Translated Word",
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "can't be empty";
                  } else
                  {
                    return null;
                  }
                },
                controller: WordLearnedCubit.get(
                  context,
                ).translatedWordController,
              ),
              BlocConsumer<WordLearnedCubit, WordLearnedStates>(
                listener: (context, state) {
                  if (state is GetWordListFailureState) {
                    showErrorSnackBar(context, state.errMessage, true);
                  }

                  if (state is GetWordListSuccessState) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is GetWordListLoadingState;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: CustomBtn(
                      title: "Save",
                      hidden: false,
                      isLoading: isLoading,
                      onTap: isLoading
                          ? null
                          : () {
                        if (WordLearnedCubit.get(context).formKey.currentState!.validate()) {
                          WordLearnedCubit.get(context).addNewWord();
                          WordLearnedCubit.get(context).getWordsList();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
