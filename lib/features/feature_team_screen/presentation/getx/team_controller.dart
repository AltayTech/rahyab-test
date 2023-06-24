import 'package:get/get.dart';
import 'package:rahyab_test/Core/params/no_param.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/entities/team_entity.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/use_case/get_team_list_usecase.dart';

import '../../../../Core/resources/data_state.dart';

class TeamController extends GetxController {
  var pageTitle = "تکمیل پروفایل مشاور".obs;
  List<TeamEntity> teamList = [];

  Future<DataState> getTeamList(GetTeamListUseCase getTeamListUseCase) async {
    DataState dataState = await getTeamListUseCase(NoParams());
    if (dataState is DataSuccess) {
      teamList = dataState.data;

      update();
    } else if (dataState is DataFailed) {}
    return dataState;
  }
}
