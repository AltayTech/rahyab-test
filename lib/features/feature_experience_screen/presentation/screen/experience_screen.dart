import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyab_test/features/feature_experience_screen/presentation/widgets/experience_item_widget.dart';

import '../../data/repository/experience_repository_impl.dart';
import '../../domain/use_case/get_experience_list_usecase.dart';
import '../getx/ex_controller.dart';

class ExperienceScreen extends StatefulWidget {
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final ExController c = Get.put(ExController());
  final ExperienceRepositoryImpl experienceRepositoryImpl = Get.find();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    GetExperienceListUseCase getExperienceListUseCase =
        GetExperienceListUseCase(experienceRepositoryImpl);
    await c.getExperienceList(getExperienceListUseCase);
  }

  @override
  Widget build(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 0),
                child:Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5F7ED),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "افزودن فرد جدید",
                        style: TextStyle(
                          color: Color(0xFF00AB4E),
                          fontFamily: 'BYekan',
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child:
                          SvgPicture.asset('assets/icons/add-square.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<ExController>(
              init: ExController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.builder(
                    itemCount: c.experienceList.length,
                    itemBuilder: (context, index) {
                      return ExperienceItemWidget(c.experienceList[index]);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
