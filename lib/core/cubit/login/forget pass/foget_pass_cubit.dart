import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_pro/core/Services/auth_api.dart';
import 'package:sooyaa_pro/core/cubit/login/forget%20pass/forget_pass_state.dart';

import '../../../errors/api_failure.dart';

class FogetPassCubit extends Cubit<ForgetPassState> {
  FogetPassCubit() : super(ForgetPassInitial());

  final AuthRepository authRepository = AuthRepository();

  Future<void> forgotPassword(String email) async {
    emit(ForgetPassLoading());
    try {
      await authRepository.forgotPassword(email);
      emit(ForgetPassSuccess());
    } catch (e) {
      if (e is ApiFailures) {
        emit(ForgetPassFailure(e.errMessage));
      } else {
        emit(ForgetPassFailure("Unexpected error occurred"));
      }
    }
  }
}
