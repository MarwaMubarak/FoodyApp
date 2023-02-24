import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_app/services/endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: Endpoints.basUrl, receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    if (token != null) dio.options.headers["Authorization"] = "Bearer $token";
    return await dio
        .get(
      url,
      queryParameters: query,
    )
        .catchError((e) {
      debugPrint(e);
    });
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    if (token != null) dio.options.headers["Authorization"] = "Bearer $token";
    return await dio
        .post(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((e) {
      debugPrint(e);
    });
  }
}
