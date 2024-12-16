import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/job_model.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key,required this.data});

  final JobModel data;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
            color:Colors.black, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Spacer(),
          Image.network(
            data.logo,
            height: 50,
            width: 50,
          ),
          const Spacer(),
          Text(
            data.companyName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            data.city ,
            style: const TextStyle(fontSize: 12),
          ),
          const Spacer(),
          //button to view company profile

          // const Spacer(),
        ],
      ),
    );
  }
}