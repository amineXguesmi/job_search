import 'package:flutter/material.dart';
import 'package:job_search/features/entreprise/data/models/job_model.dart';

class JobViewPage extends StatefulWidget {
  const JobViewPage({super.key, required this.model});

  final JobModel model;

  @override
  State<JobViewPage> createState() => _JobViewPageState();
}

class _JobViewPageState extends State<JobViewPage> {
  final tabButtons = ["Description", "Company", "Reviews"];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  width: size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5jBNCrSIliAtwGH3ma96nTBxKfMRhkvEm8g&usqp=CAU"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      SafeArea(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.title,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.model.salary,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            // Chip(
                            //     labelPadding: const EdgeInsets.all(0),
                            //     label: Text(data.getJobData()[index].type))
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                widget.model.type,
                                style: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(widget.model.logo),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.model.companyName,
                                  style: const TextStyle(
                                      //color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.model.city,
                                  style: const TextStyle(
                                      //color: Colors.grey.shade200,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              widget.model.time,
                              style: const TextStyle(
                                  //color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: tabButtons.map((e) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              tabIndex = tabButtons.indexOf(e);
                            });
                          },
                          child: Chip(
                              backgroundColor: tabIndex == tabButtons.indexOf(e)
                                  ? Colors.black
                                  : Colors.white,
                              label: Text(
                                e,
                                style: TextStyle(
                                    color: tabIndex == tabButtons.indexOf(e)
                                        ? Colors.white
                                        : Colors.black),
                              )));
                    }).toList()),
                tabIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: 170,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                              "Looking for a proficient UI/UX developer experienced in Flutter framework. Must excel in Dart programming language with a strong grasp of UI design principles. Portfolio showcasing expertise in mobile app design is essential."),
                        ),
                      )
                    : tabIndex == 1
                        // ? const Text(
                        //     "Welcome to our company, where innovation meets excellence. We're committed to delivering cutting-edge solutions tailored to meet our clients' needs. With a dynamic team of experts, we strive to exceed expectations and drive success. Join us on our journey towards greatness.")
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: 170,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                  "Welcome to our company, where innovation meets excellence. We're committed to delivering cutting-edge solutions tailored to meet our clients' needs. With a dynamic team of experts, we strive to exceed expectations and drive success. Join us on our journey towards greatness."),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: 170,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Exceptional service! The team at this company goes above and beyond to deliver outstanding results. Their innovative solutions have truly transformed our business. Highly recommend!",
                              ),
                            ),
                          ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Apply Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
