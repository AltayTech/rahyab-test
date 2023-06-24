import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyab_test/Core/widgets/title_bar_nav.dart';
import 'package:rahyab_test/features/feature_about_screen/presentation/screen/about.dart';
import 'package:rahyab_test/features/feature_experience_screen/presentation/screen/experience_screen.dart';

import '../../features/feature_team_screen/presentation/getx/team_controller.dart';
import '../../features/feature_team_screen/presentation/screen/home.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  static const routeName = '/MainWrapper';

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final TeamController c = Get.find();

    List<Widget> pageViewWidget = [
      HomeScreen(),
      ExperienceScreen(),
      const AboutScreen(),
    ];
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        // bottomNavigationBar: BottomNav(pageController: pageController),
        appBar: AppBar(
          title: Obx(() => Text(
                c.pageTitle.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'BYekan',
                ),
                textAlign: TextAlign.center,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            TitleBarNav(
              pageController: pageController,
            ),
            SizedBox(
              height: height * 0.75,
              child: PageView(
                controller: pageController,
                children: pageViewWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
