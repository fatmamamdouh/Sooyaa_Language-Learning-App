abstract class ConfirmEmailState {}

class ConfirmEmailInitial extends ConfirmEmailState {}

class ConfirmEmailSuccess extends ConfirmEmailState {}

class ConfirmEmailFailure extends ConfirmEmailState {
  final String errMessage;
  ConfirmEmailFailure( this.errMessage);
}

class ConfirmEmailLoading extends ConfirmEmailState {}
