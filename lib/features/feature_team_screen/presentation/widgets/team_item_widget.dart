import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/entities/team_entity.dart';

class TeamItemWidget extends StatelessWidget {
  final TeamEntity teamEntity;

  const TeamItemWidget(this.teamEntity, {super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset('assets/icons/edit.svg'),

                    // Icon(Icons.edit_calendar_outlined, color: Colors.green),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          teamEntity.name.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontFamily: 'BYekan',
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                teamEntity.details.toString(),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontFamily: 'BYekan',
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.calendar_month, size: 18),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "ترکیه - استانبول",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: 'BYekan',
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(
                            int.parse("0x${teamEntity.backgroundItem!}"))),
                    child: SizedBox(
                      height: 54,
                      width: 54,
                      child: SvgPicture.network(teamEntity.icon!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
