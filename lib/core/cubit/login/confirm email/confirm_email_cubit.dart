import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_pro/core/Services/auth_api.dart';
import '../../../errors/api_failure.dart';
import 'confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit() : super(ConfirmEmailInitial());

  final AuthRepository authRepository = AuthRepository();

  Future<void> confirmEmail(String email) async {
    emit(ConfirmEmailLoading());
    try {
      await authRepository.confirmEmail(email);
      emit(ConfirmEmailSuccess());
    } catch (e) {
      if (e is ApiFailures) {
        emit(ConfirmEmailFailure(e.errMessage));
      } else {
        emit(ConfirmEmailFailure("Unexpected error occurred"));
      }
    }
  }
}
