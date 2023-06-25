import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/constants.dart';

class TeamApiProvider {
   final Dio dio = Dio();



  var getListURL = Constants.basicURL + Constants.getList;

  /// Return team list from api
  Future<dynamic> getTeamList() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    var response = await dio.get(getListURL,
        options: Options(headers: {'Authorization': "hi"}),
        queryParameters: {});
    debugPrint(response.toString());

    return response;
  }
}
