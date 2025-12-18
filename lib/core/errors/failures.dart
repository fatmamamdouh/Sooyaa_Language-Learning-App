import 'package:dio/dio.dart';

class Failures {
  final String errMessage;

  Failures(this.errMessage);
}


bool isEmailNotConfirmed(DioException e) {
  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    final errors = data['errors'];

    if (errors is List) {
      return errors.contains('User.EmailNotConfirmed') ||
          errors.any(
            (e) => e.toString().toLowerCase().contains('not confirmed'),
          );
    }
  }

  return false;
}