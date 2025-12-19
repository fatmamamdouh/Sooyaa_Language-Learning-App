abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class GetHomeDataLoadingState extends HomeStates{}
class GetHomeDataSuccessState extends HomeStates{}
class GetHomeDataFailureState extends HomeStates
{
  final String errMessage;
  GetHomeDataFailureState({required this.errMessage});
}