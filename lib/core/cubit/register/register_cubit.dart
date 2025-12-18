import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Services/auth_api.dart';
import '../../cubit/register/register_state.dart';
import '../../errors/api_failure.dart';
import '../../model/register_input_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository repository = AuthRepository();
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  void setName({
    required String firstName,
    required String lastName,
  }) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  Future<void> register() async {
    if (firstName == null ||
        lastName == null ||
        email == null ||
        password == null) {
      emit(AuthFailure("Please complete all steps"));
      return;
    }

    emit(AuthLoading());

    try {
      await repository.register(
        RegisterRequest(
          firstName: firstName!,
          lastName: lastName!,
          email: email!,
          password: password!,
        ),
      );
      emit(AuthSuccess());
    } catch (e) {
      if (e is ApiFailures) {
        emit(AuthFailure(e.errMessage));
      } else {
        emit(AuthFailure("Unexpected error occurred"));
      }
    }
  }
}
