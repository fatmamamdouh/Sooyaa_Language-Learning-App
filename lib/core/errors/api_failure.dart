import 'package:dio/dio.dart';
import '../../core/errors/failures.dart';

class ApiFailures extends Failures {
  ApiFailures(super.errMessage);

  factory ApiFailures.fromDioException(DioException dioEx) {
    switch (dioEx.type) {
      case DioExceptionType.connectionTimeout:
        return ApiFailures("Connection timeout. Please try again later.");

      case DioExceptionType.sendTimeout:
        return ApiFailures("Send timeout. Check your internet connection.");

      case DioExceptionType.receiveTimeout:
        return ApiFailures("Receive timeout. Server took too long to respond.");

      case DioExceptionType.badCertificate:
        return ApiFailures("Bad certificate. Secure connection failed.");

      case DioExceptionType.badResponse:
        final statusCode = dioEx.response?.statusCode ?? 0;
        return ApiFailures.fromBadResponse(statusCode);

      case DioExceptionType.cancel:
        return ApiFailures("Request was cancelled.");

      case DioExceptionType.connectionError:
        return ApiFailures("Connection error. Please check your network.");

      case DioExceptionType.unknown:
        return ApiFailures("Unexpected error occurred: ${dioEx.message}");
    }
  }

  factory ApiFailures.fromBadResponse(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiFailures("Bad request.");
      case 401:
        return ApiFailures("Email or password is incorrect.");
      case 403:
        return ApiFailures("Forbidden. You don't have permission.");
      case 404:
        return ApiFailures("Resource not found.");
      case 409:
        return ApiFailures("Conflict. User already exists.");
      case 422:
        return ApiFailures("Validation error.");
      case 500:
        return ApiFailures("Internal server error.");
      case 503:
        return ApiFailures("Service unavailable. Try again later.");
      default:
        return ApiFailures("Received invalid status code: $statusCode");
    }
  }

  factory ApiFailures.emailNotConfirmed() {
    return ApiFailures("Email not confirmed. Please check your email.");
  }
}
