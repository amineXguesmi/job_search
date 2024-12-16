import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search/features/candidate/data/datasources/fake_applied.dart';
import 'package:job_search/presentation/presentation.dart';

import '../../../data/models/applyed_jobs.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    super.initState();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryOrange.withOpacity(0.5),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: AppColors.primaryOrange.withOpacity(0.5),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 15,
                  left: 20,
                  child: Text(
                    "Applied Jobs",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff363f93),
                    ),
                  ),
                ),
              ],
            ),
          ),
          xxsSpacer(),
          Expanded(
            child: isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView.builder(
                      itemCount: fakeAppliedJobs.length,
                      itemBuilder: (_, index) {
                        return AppliedCard(
                          appliedJob: fakeAppliedJobs[index],
                          index: index,
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class AppliedCard extends StatelessWidget {
  final AppliedJob appliedJob;
  final int index;

  const AppliedCard({
    Key? key,
    required this.appliedJob,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appliedDate = DateTime.parse(appliedJob.appliedDate!);
    final appliedDateString = DateFormat.MMMMEEEEd().format(appliedDate);
    final pos = index % 2 == 0 ? 'left' : 'right';

    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange,
            AppColors.primaryOrange.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: pos == 'left'
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(80),
              ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff363f93).withOpacity(0.3),
            offset: const Offset(-10, 0),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 38,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appliedJob.job!.company!.name!,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              appliedJob.job!.title!,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              appliedJob.job!.company!.region! + ", " + appliedJob.job!.company!.country!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            xxxsSpacer(),
            Row(
              children: [
                const Text(
                  "Applied on: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  appliedDateString,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            xxxsSpacer(),
            Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  appliedJob.status!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
