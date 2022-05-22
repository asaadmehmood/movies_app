import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:movies_app/models/server_response.dart';
import 'package:movies_app/utils/app_constants.dart';

class ApiService {
  static var logger = Logger();
  static Map<String, String> headerMap = {"Accept": "application/json"};
  static String BASE_URL = "http://staging.yarnonline.net/";
  static String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";
  static String BASE_API_URL = "https://api.themoviedb.org/3/movie";
  static const String MOVIES_END_POINT = "/upcoming";

  static BaseOptions opts = BaseOptions(
    baseUrl: ApiService.BASE_API_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts)..interceptors;
  }
  static final baseAPI = createDio();
  static Future<SeverResponse> movies() async {
    try {
      String url = BASE_API_URL + MOVIES_END_POINT;
      Response response = await baseAPI.get(url,queryParameters: {'api_key':'3ab677f66c4c848c497607a4fee4ee3a'});
      logger.e(response.data.toString());
      return SeverResponse.fromJson(
          response.data
      );
    } catch (e) {
      if (e is SocketException) {
        throw (no_internet_available_msg);
      } else if (e is TimeoutException) {
        throw (e.toString());
      } else {
        throw ("Something went wrong"+e.toString());
      }
    }
  }


}
