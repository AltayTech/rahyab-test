import 'package:get/get.dart';
import 'package:rahyab_test/features/feature_experience_screen/data/repository/experience_repository_impl.dart';
import 'package:rahyab_test/features/feature_experience_screen/presentation/getx/ex_controller.dart';
import 'package:rahyab_test/features/feature_team_screen/data/data_source/remote/team_api_provider.dart';
import 'package:rahyab_test/features/feature_team_screen/data/repository/team_repository_impl.dart';
import 'package:rahyab_test/features/feature_team_screen/presentation/getx/team_controller.dart';

import 'features/feature_about_screen/data/data_source/remote/about_api_provider.dart';
import 'features/feature_about_screen/data/repository/about_repository_impl.dart';
import 'features/feature_about_screen/presentation/getx/about_controller.dart';
import 'features/feature_experience_screen/data/data_source/remote/ex_api_provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TeamApiProvider());
    Get.put(ExApiProvider());
    Get.put(AboutApiProvider());

    Get.put<TeamController>(TeamController());
    Get.put<ExController>(ExController());
    Get.put<AboutController>(AboutController());

    Get.put(TeamRepositoryImpl(Get.find()));
    Get.put(ExperienceRepositoryImpl(Get.find()));
    Get.put(AboutRepositoryImpl(Get.find()));
  }
}
