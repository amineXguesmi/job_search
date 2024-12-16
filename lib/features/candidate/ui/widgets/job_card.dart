import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/presentation.dart';

import '../../data/datasources/get_data.dart';
import '../screens/job_view/job_view.dart';


class JobCard extends StatelessWidget {
  final String uniqueIdentifier;

  JobCard({super.key, required this.uniqueIdentifier});

  List<LinearGradient> gradients = [
    const LinearGradient(
      colors: [Color(0xffaddbaf), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffb1fff8), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffa8b0e1), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffdf9fea), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xfff9978f), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    )
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 20,
            offset: Offset(10, 10),
          )
        ],
      ),
      child: OpenContainer(
        key: Key(uniqueIdentifier ),
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: Colors.green,
        openElevation: 0,
        openBuilder: (context, action) {
          return JobViewPage(
            model: GetData().getJobData()[0],
          );
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 150,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius:
                BorderRadiusDirectional.circular(15),
                gradient: gradients[_random.nextInt(gradients.length)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      'logo!',
                      height: 30,
                      width: 30,
                    ),
                    xxsSpacer(),
                    Text(
                      "data.company!.name!,"
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart_icon.svg',
                      height: 20,
                      width: 20,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                 " data.title!",
                ),
                xxsSpacer(),
                Text(
                  // data.sector!.title!,
                  "data.company!.region! + "" + data.company!.country!",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
