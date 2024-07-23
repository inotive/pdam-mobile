// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pdam_inventory/app/config_app.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";

class DioFactory {
  final AppPreference _appPreference;

  DioFactory(this._appPreference);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    String token = await _appPreference.getUserToken();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: token,
    };

    dio.options = BaseOptions(
        baseUrl: ConfigApp.baseUrl,
        connectTimeout: Duration(seconds: timeOut),
        receiveTimeout: Duration(seconds: timeOut),
        validateStatus: (status) => true,
        headers: headers);

    if (kReleaseMode) {
      log("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
