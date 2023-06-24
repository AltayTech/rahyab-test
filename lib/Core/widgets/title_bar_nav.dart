import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleBarNav extends StatefulWidget {
  final PageController pageController;

  const TitleBarNav({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<TitleBarNav> createState() => _TitleBarNavState();
}

class _TitleBarNavState extends State<TitleBarNav> {
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = widget.pageController.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        setState(() {
                          page = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: page == 0
                            ? SvgPicture.asset(
                                'assets/icons/people_on.svg',
                              )
                            : SvgPicture.asset(
                                'assets/icons/people_off.svg',
                              ),
                      ),
                    ),
                    Text(
                      "تیم ما",
                      style: TextStyle(
                        fontFamily: 'BYekan',
                        fontSize: 10,
                        color: page == 0 ? Colors.green : Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: Container(
                        height: 2,
                        // width: 100,
                        decoration: BoxDecoration(
                          color: page == 0 ? Colors.green : Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        setState(() {
                          page = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: page == 1
                            ? SvgPicture.asset(
                                'assets/icons/cup_on.svg',
                              )
                            : SvgPicture.asset(
                                'assets/icons/cup_off.svg',
                              ),
                      ),
                    ),
                    Text(
                      "سوابق و افتخارات",
                      style: TextStyle(
                        fontFamily: 'BYekan',
                        fontSize: 10,
                        color: page == 1 ? Colors.green : Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: Container(
                        height: 2,
                        // width: 100,
                        decoration: BoxDecoration(
                          color: page == 1 ? Colors.green : Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        setState(() {
                          page = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: page == 2
                            ? SvgPicture.asset(
                                'assets/icons/user_on.svg',
                              )
                            : SvgPicture.asset(
                                'assets/icons/user_off.svg',
                              ),
                      ),
                    ),
                    Text(
                      "درباره مشاور",
                      style: TextStyle(
                        fontFamily: 'BYekan',
                        fontSize: 10,
                        color: page == 2 ? Colors.green : Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        height: 2,
                        // width: 100,
                        decoration: BoxDecoration(
                          color: page == 2 ? Colors.green : Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
