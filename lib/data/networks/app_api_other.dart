import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';

class AppServiceClientOther {
  AppServiceClientOther(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://pdam.inotivedev.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  Future<UpdateUserResponse> update(
    String token,
    String name,
    String password,
    String phone,
    File file,
  ) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = FormData();
    data.fields.add(MapEntry(
      'name',
      name,
    ));
    data.fields.add(MapEntry(
      'password',
      password,
    ));

    data.fields.add(MapEntry(
      'phone',
      phone,
    ));
    if (file.path != "") {
      data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<UpdateUserResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          _dio.options,
          '/auth/update',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = UpdateUserResponse.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
