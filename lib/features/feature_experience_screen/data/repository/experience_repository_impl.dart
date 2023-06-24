import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rahyab_test/Core/resources/data_state.dart';

import '../../domain/entities/experience_entity.dart';
import '../../domain/repositories/experience_repository.dart';
import '../data_source/remote/ex_api_provider.dart';
import '../models/experience_model.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {
  late ExApiProvider apiProvider;

  ExperienceRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<ExperienceEntity>>> fetchExperienceData() async {
    try {
      Response response = await apiProvider.getExperienceList();
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        List<ExperienceEntity> teamList = [];
        if (response.data['data'] != null) {
          response.data['data'].forEach((v) {
            teamList.add(ExperienceModel.fromJson(v));
          });
        }

        return DataSuccess(teamList);
      } else {
        return DataFailed('Something went wrong...');
      }
    } catch (e) {
      debugPrint(e.toString());

      return DataFailed(e.toString());
    }
  }
}
