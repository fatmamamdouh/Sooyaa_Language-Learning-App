import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Services/auth_api.dart';
import '../../cubit/login/login_state.dart';
import '../../errors/api_failure.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  AuthRepository repository = AuthRepository();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await repository.login(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      if (e is ApiFailures) {
        if (e.errMessage == "Email not confirmed. Please check your email.") {
          emit(LoginEmailNotConfirmed());
        } else {
          emit(LoginFailure(e.errMessage));
        }
      } else {
        emit(LoginFailure("Unexpected error occurred"));
      }
    }
  }
}
