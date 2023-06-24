import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyab_test/features/feature_team_screen/data/repository/team_repository_impl.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/use_case/get_team_list_usecase.dart';
import 'package:rahyab_test/features/feature_team_screen/presentation/widgets/team_item_widget.dart';

import '../getx/team_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TeamController c = Get.put(TeamController());
  final TeamRepositoryImpl teamRepository = Get.find();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    GetTeamListUseCase getTeamListUseCase = GetTeamListUseCase(teamRepository);
    await c.getTeamList(getTeamListUseCase);
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
                child: Container(
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
            child: GetBuilder<TeamController>(
              init: TeamController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.builder(
                    itemCount: c.teamList.length,
                    itemBuilder: (context, index) {
                      return TeamItemWidget(c.teamList[index]);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
