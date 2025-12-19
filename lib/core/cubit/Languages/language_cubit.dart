import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_app/core/Services/get_apis.dart';
import '../../errors/api_failure.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final GetApis getApis;

  LanguageCubit(this.getApis) : super(LanguageInitial());

  Future<void> getLanguages() async {
    emit(LanguageLoading());
    try {
      final languages = await getApis.getAllLanguages();
      emit(LanguageSuccess(languages));
    } catch (e) {
      if (e is ApiFailures) {
        emit(LanguageFailure(e.errMessage));
      } else {
        emit(LanguageFailure("Unexpected error occurred"));
      }
    }
  }
}
