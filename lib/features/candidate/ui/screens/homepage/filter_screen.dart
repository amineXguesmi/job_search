import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../presentation/presentation.dart';
import '../../../../shared_features/ui/widgets/category_bar.dart';
import '../../../data/datasources/get_data.dart';
import '../../widgets/company_card.dart';
import '../../widgets/job_card.dart';
import '../job_view/job_view.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _cardIndex = 0;
  GetData data = GetData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      xxsSpacer(),

                      SvgPicture.asset(
                        Assets.searchImage,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      mdSpacer(),
                      Text(
                        "Browse through our vast trove of jobs and companies",
                        style: TextStyles.buttonSemibold(
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                      xxsSpacer(),

                      Text(
                        "Get started by filtering your search",
                        style: TextStyles.calloutRegular(
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                xxsSpacer(),
                const SearchControl(),
                SizedBox(
                  width: double.infinity,
                  height: context.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const CategoryBar(
                        title: 'top Companies',
                      ),
                      const Spacer(),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          viewportFraction: 0.8,
                          initialPage: _cardIndex,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _cardIndex = index;
                            });
                          },
                        ),
                        itemCount: data.getJobData().length,
                        itemBuilder: (BuildContext context, int index, int _) => Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: CompanyCard(
                            data: data.getJobData()[index],
                          ),
                        ),

                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    xxsSpacer(),
                    const CategoryBar(
                      title: 'Popular Jobs',
                    ),
                    xxsSpacer(),
            Column(
              children: List.generate(data.getJobData().length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobViewPage(
                                model: data.getJobData()[index],
                              )));
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.getJobData()[index].logo),
                          radius: 25,
                        ),
                        title: Text(data.getJobData()[index].title),
                        subtitle: Text(
                          "${data.getJobData()[index].companyName} - ${data.getJobData()[index].type}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text(data.getJobData()[index].time),
                      ),
                    ),
                  ),
                );
              }),
            ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
