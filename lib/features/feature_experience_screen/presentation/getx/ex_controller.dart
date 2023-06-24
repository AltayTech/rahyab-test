import 'package:get/get.dart';
import 'package:rahyab_test/Core/params/no_param.dart';

import '../../../../Core/resources/data_state.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/use_case/get_experience_list_usecase.dart';

class ExController extends GetxController {
  var pageTitle = "تکمیل پروفایل مشاور".obs;
  List<ExperienceEntity> experienceList = [];

  Future<DataState> getExperienceList(
      GetExperienceListUseCase getExperienceListUseCase) async {
    DataState dataState = await getExperienceListUseCase(NoParams());
    if (dataState is DataSuccess) {
      experienceList = dataState.data;

      update();
    } else if (dataState is DataFailed) {}
    return dataState;
  }
}
