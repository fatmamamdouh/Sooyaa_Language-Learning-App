import '../../model/language_model.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageSuccess extends LanguageState {
  final List<LanguageModel> languages;

  LanguageSuccess(this.languages);
}

class LanguageFailure extends LanguageState {
  final String error;

  LanguageFailure(this.error);
}
