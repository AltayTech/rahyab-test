import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

import '../../../../../Core/utils/constants.dart';

class ExApiProvider {
  final Dio _dio = Dio();

  var getListURL = Constants.basicURL + Constants.getList;

  /// Return list from api
  Future<dynamic> getExperienceList() async {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    var response = await _dio.get(getListURL,
        options: Options(headers: {'Authorization': "hi"}),
        queryParameters: {});

    // debugPrint(response.toString());

    return response;
  }
}
