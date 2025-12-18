import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    if (kDebugMode) {
      print("Dio class is created");
    }

    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        baseUrl: 'https://sooyaaapp.runasp.net/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static void headersOfAPI() {
    dio?.options.headers = {'Content-Type': 'application/json; charset=utf-8'};
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio!.get(
      options: token != null
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null,
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    headersOfAPI();

    return dio!.delete(url, queryParameters: query, data: data);
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    headersOfAPI();

    return dio!.patch(url, data: data, queryParameters: query);
  }
}
