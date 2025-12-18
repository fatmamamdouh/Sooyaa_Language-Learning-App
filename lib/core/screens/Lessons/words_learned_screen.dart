import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/word_learned/word_learned_cubit.dart';
import '../../cubit/word_learned/word_learned_states.dart';
import '../../resources/app_colors.dart';
import '../../customs/Dialog/add_word_dialogue.dart';

class WordsLearnedScreen extends StatelessWidget {
  const WordsLearnedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Words Learned')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddWordDialogue(),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      body: BlocBuilder<WordLearnedCubit, WordLearnedStates>(
        builder: (context, state) {
          final cubit = WordLearnedCubit.get(context);

          if (state is GetWordListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetWordListFailureState) {
            return Center(child: Text(state.errMessage));
          }

          if (cubit.wordListModel.isEmpty) {
            return const Center(child: Text('No words yet'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: cubit.wordListModel.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final word = cubit.wordListModel[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey5,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(word.arabicWord),
                      Icon(Icons.compare_arrows_outlined,
                          color: AppColors.primaryColor),
                      Text(word.foreignWord),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
