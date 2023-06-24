import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/constants.dart';

class AboutApiProvider {
  final Dio _dio = Dio();

  var sendDaysURL = Constants.basicURL + Constants.sendDay;

  /// send days list to api
  Future<dynamic> sendDaysList(String selectedDays) async {
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
