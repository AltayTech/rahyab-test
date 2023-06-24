import 'package:get/get.dart';

import '../../../../Core/resources/data_state.dart';
import '../../domain/use_case/get_about_usecase.dart';

class AboutController extends GetxController {
  var pageTitle = "تکمیل پروفایل مشاور".obs;

  Map<String, String> allDaysList = {
    'شنبه': '1',
    'یک شنبه': '2',
    'دوشنبه': '3',
    'سه شنبه': '4',
    'چهارشنبه': '5',
    'پنج شنبه': '6',
    'جمعه': '7',
  }.obs;

  RxList selectedDaysList = [].obs;

  Future<String> convertToString(RxList selectedDays) async {
    String selectedDaysString = '';
    for (int i = 0; i < selectedDays.length; i++) {
      if (i == 0) {
        selectedDaysString = selectedDays[i];
      } else {
        selectedDaysString = "$selectedDaysString,${selectedDays[i]}";
      }
    }

    return selectedDaysString;
  }

  Future<DataState> sendDaysList(
      GetAboutListUseCase getAboutListUseCase) async {
    String daysList = await convertToString(selectedDaysList);
    DataState dataState = await getAboutListUseCase(daysList);
    if (dataState is DataSuccess) {
      update();
    } else if (dataState is DataFailed) {}
    return dataState;
  }
}
