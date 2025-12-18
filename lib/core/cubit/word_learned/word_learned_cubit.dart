import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Services/api_services.dart';
import '../../Services/end_points.dart';
import '../../cubit/word_learned/word_learned_states.dart';
import '../../model/word_list_model.dart';
import '../../errors/api_failure.dart';

class WordLearnedCubit extends Cubit<WordLearnedStates> {
  WordLearnedCubit() : super(InitialWordLearnedState()) {
    getWordsList();
  }

  static WordLearnedCubit get(context) => BlocProvider.of(context);

  TextEditingController wordController = TextEditingController();
  TextEditingController translatedWordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<WordListModel> wordListModel = [];

  Future<void> getWordsList() async {
    emit(GetWordListLoadingState());

    try {
      var value = await DioHelper.getData(url: wordList);
      wordListModel =
          (value.data as List).map((e) => WordListModel.fromJson(e)).toList();

      if (kDebugMode) {
        print("data get successfully --------------");
        print(value.data);
      }
      emit(GetWordListSuccessState());
    } on DioException catch (e) {
      emit(
        GetWordListFailureState(
          errMessage: ApiFailures.fromDioException(e).errMessage,
        ),
      );
    } catch (e) {
      emit(GetWordListFailureState(errMessage: e.toString()));
    }
  }

  String? successMessage;

  Future<void> addNewWord() async {
    emit(AddNewWordLoadingState());

    try {
      var value = await DioHelper.postData(url: addWord, data: {
        "userId": "511dd64a-a0ec-4054-8c16-999df41e68b7",
        "languageId": 19,
        "arabicWord": wordController.text,
        "foreignWord": translatedWordController.text
      });

      if (kDebugMode) {
        print("data send successfully --------------");
        print(value.data);
      }
      successMessage = value.data;
      emit(AddNewWordSuccessState());
      getWordsList();
    } on DioException catch (e) {
      emit(
        AddNewWordFailureState(
          errMessage: ApiFailures.fromDioException(e).errMessage,
        ),
      );
    } catch (e) {
      emit(AddNewWordFailureState(errMessage: e.toString()));
    }
  }
}
