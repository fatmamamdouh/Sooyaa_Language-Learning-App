abstract class WordLearnedStates{}

class InitialWordLearnedState extends WordLearnedStates{}

class GetWordListLoadingState extends WordLearnedStates{}
class GetWordListSuccessState extends WordLearnedStates{}
class GetWordListFailureState extends WordLearnedStates{
  final String errMessage;
  GetWordListFailureState({required this.errMessage});
}


class AddNewWordLoadingState extends WordLearnedStates{}
class AddNewWordSuccessState extends WordLearnedStates{}
class AddNewWordFailureState extends WordLearnedStates{
  final String errMessage;
  AddNewWordFailureState({required this.errMessage});
}

