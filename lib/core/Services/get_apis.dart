import 'package:dio/dio.dart';
import '../../core/Services/api_services.dart';
import '../errors/api_failure.dart';
import '../model/language_model.dart';

class GetApis {
 Future<List<LanguageModel>> getAllLanguages() async {
    try {
      final response = await DioHelper.getData(
        url: 'Language/getAllLanguages',
      );

      return (response.data as List)
          .map((e) => LanguageModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ApiFailures.fromDioException(e);
    }
  }
}
