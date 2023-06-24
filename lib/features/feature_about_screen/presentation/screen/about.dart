import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/about_repository_impl.dart';
import '../../domain/use_case/get_about_usecase.dart';
import '../getx/about_controller.dart';
import '../widgets/about_item_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final AboutController c = Get.put(AboutController());
  final AboutRepositoryImpl aboutRepository = Get.find();


  @override
  Widget build(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    GetAboutListUseCase getAboutListUseCase =
        GetAboutListUseCase(aboutRepository);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<AboutController>(
              init: AboutController(),
              builder: (_) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.builder(
                    itemCount: c.allDaysList.length,
                    itemBuilder: (context, index) {
                      return AboutItemWidget(
                          c.allDaysList.entries.elementAt(index));
                    }),
              ),
            ),
          ),
          Container(
            width: width,
            height: 90,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 19,
                  offset: Offset(0, -3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 312,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF2F2F2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'انصراف',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF575757),
                                    fontSize: 10,
                                    fontFamily: 'Yekan Bakh',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await c.sendDaysList(getAboutListUseCase);
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF00AB4E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'ذخیره',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Yekan Bakh',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
