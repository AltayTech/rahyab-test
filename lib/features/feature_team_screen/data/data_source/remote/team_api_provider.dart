import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/constants.dart';

class TeamApiProvider {
  final Dio _dio = Dio();

  var getListURL = Constants.basicURL + Constants.getList;

  /// Return team list from api
  Future<dynamic> getTeamList() async {
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
