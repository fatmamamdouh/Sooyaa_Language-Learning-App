import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_app/core/cubit/word_learned/word_learned_cubit.dart';
import 'package:sooyaa_app/core/cubit/word_learned/word_learned_states.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';
import 'package:sooyaa_app/core/resources/text_style.dart';
import 'package:sooyaa_app/core/screens/Lessons/widgets/add_word_dialogue.dart';

class WordsLearnedScreen extends StatelessWidget {
  const WordsLearnedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Words Learned')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddWordDialogue());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.white),
      ),
      body: BlocBuilder<WordLearnedCubit, WordLearnedStates>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                WordLearnedCubit.get(context).wordListModel[index].arabicWord,
                style: AppTextStyle.style20.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(
                WordLearnedCubit.get(context).wordListModel[index].foreignWord,
                style: AppTextStyle.style16.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 2,
              color: AppColors.fillColor,
            ),
            itemCount: WordLearnedCubit.get(context).wordListModel.length,
          ),
        ),
      ),
    );
  }
}
