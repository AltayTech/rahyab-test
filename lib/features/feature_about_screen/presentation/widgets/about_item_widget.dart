import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/about_controller.dart';

class AboutItemWidget extends StatefulWidget {
  final MapEntry<String, String> day;

  const AboutItemWidget(this.day, {super.key});

  @override
  State<AboutItemWidget> createState() => _AboutItemWidgetState();
}

class _AboutItemWidgetState extends State<AboutItemWidget> {
  bool checkValue = false;
  ExpandableController expandableController =
      ExpandableController(initialExpanded: false);
  TextEditingController textEditingControllerStart =
      TextEditingController(text: '9:00');
  TextEditingController textEditingControllerEnd =
      TextEditingController(text: '18:00');
  final AboutController c = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandableNotifier(
                child: Expandable(
                  controller: expandableController,
                  collapsed: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'باز است',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'BYekan',
                              fontSize: 10,
                              color: Colors.black38,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          widget.day.key.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontFamily: 'BYekan',
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        value: checkValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValue = value!;
                            c.selectedDaysList.add(widget.day.value);

                            expandableController.value = true;
                            setState(() {});
                          });
                        },
                      ),
                    ],
                  ),
                  expanded: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'باز است',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: 'BYekan',
                                  fontSize: 10,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              widget.day.key.toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontFamily: 'BYekan',
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            value: checkValue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkValue = value!;
                                c.selectedDaysList.remove(widget.day.value);

                                expandableController.value = false;
                                setState(() {});
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "تا ساعت",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontFamily: 'BYekan',
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingControllerEnd,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintTextDirection: TextDirection.rtl,

                                      fillColor: Colors.grey[150],
                                      filled: true,
                                      // labelText: '9:00',
                                      hintText: 'ساعت',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "از ساعت",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: 'BYekan',
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextField(
                                  controller: textEditingControllerStart,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintTextDirection: TextDirection.rtl,

                                    fillColor: Colors.grey[150],
                                    filled: true,
                                    // labelText: '9:00',
                                    hintText: 'ساعت',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 8, bottom: 0),
                            child: Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      "24 ساعته باز است",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'BYekan',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
