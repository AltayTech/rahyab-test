import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rahyab_test/Core/resources/data_state.dart';
import 'package:rahyab_test/features/feature_team_screen/data/models/team_model.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/entities/team_entity.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/repositories/team_repository.dart';

import '../data_source/remote/team_api_provider.dart';

class TeamRepositoryImpl extends TeamRepository {
  late TeamApiProvider apiProvider;

  TeamRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<TeamEntity>>> fetchTeamData() async {
    try {
      Response response = await apiProvider.getTeamList();
      debugPrint(response.toString());

      if (response.statusCode == 200) {
        List<TeamEntity> teamList = [];
        if (response.data['data'] != null) {
          response.data['data'].forEach((v) {
            teamList.add(TeamModel.fromJson(v));
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
