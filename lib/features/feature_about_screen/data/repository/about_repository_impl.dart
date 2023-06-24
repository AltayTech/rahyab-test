import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rahyab_test/Core/resources/data_state.dart';

import '../../domain/repositories/about_repository.dart';
import '../data_source/remote/about_api_provider.dart';

class AboutRepositoryImpl extends AboutRepository {
  late AboutApiProvider apiProvider;

  AboutRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<String>> fetchAboutData(String daysList) async {
    try {
      Response response = await apiProvider.sendDaysList(daysList);
      debugPrint('response.toString()');
      debugPrint(response.toString());

      if (response.statusCode == 201) {

        return DataSuccess(response.statusCode.toString());
      } else {
        return DataFailed('Something went wrong...');
      }
    } catch (e) {
      debugPrint(e.toString());

      return DataFailed(e.toString());
    }
  }
}
