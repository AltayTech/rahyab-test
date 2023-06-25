import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

import '../../../../../Core/utils/constants.dart';

class AboutApiProvider {
  final Dio _dio = Dio();

  var sendDaysURL = Constants.basicURL + Constants.sendDay;

  /// send days list to api
  Future<dynamic> sendDaysList(String selectedDays) async {
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
    var response = await _dio.post(sendDaysURL, queryParameters: {
      "selected_day": selectedDays,
    });

    // debugPrint(response.toString());

    return response;
  }
}
