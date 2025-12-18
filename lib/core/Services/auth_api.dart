import 'package:dio/dio.dart';
import '../../core/Services/api_services.dart';
import '../errors/api_failure.dart';
import '../errors/failures.dart';
import '../model/register_input_model.dart';

class AuthRepository {
  Future<void> register(RegisterRequest request) async {
    try {
      await DioHelper.postData(
        url: 'Auth/register',
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ApiFailures.fromDioException(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await DioHelper.postData(
        url: 'Auth',
        data: {
          "email": email,
          "password": password,
        },
      );
    } on DioException catch (e) {
      if (isEmailNotConfirmed(e)) {
        throw ApiFailures.emailNotConfirmed();
      }
      throw ApiFailures.fromDioException(e);
    }
  }

  Future<void> confirmEmail(String email) async {
    try {
      await DioHelper.postData(
        url: "Auth/resend-confirmation-email",
        data: {
          "email": email,
        },
      );
    } on DioException catch (e) {
      throw ApiFailures.fromDioException(e);
    }
  }


  Future <void> forgotPassword(String email) async {
    try {
      await DioHelper.postData(
        url: "Auth/forget-password",
        data: {
          "email": email,
        },
      );
    } on DioException catch (e) {
      throw ApiFailures.fromDioException(e);
    }
  }
}





