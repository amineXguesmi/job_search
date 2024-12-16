import 'package:flutter/material.dart';
import 'package:job_search/features/shared_features/ui/widgets/app_bar.dart';
import 'package:job_search/features/shared_features/ui/widgets/category_bar.dart';
import 'package:job_search/features/shared_features/ui/widgets/greetings_text.dart';
import 'package:job_search/features/shared_features/ui/widgets/popular_row.dart';
import 'package:job_search/features/shared_features/ui/widgets/recent_column.dart';
import 'package:job_search/presentation/presentation.dart';

import '../../../data/datasources/get_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetData data = GetData();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                xxsSpacer(),
                SizedBox(
                    width: context.width,
                    child: const GreetingsText()),
                xxsSpacer(),
                const SearchControl(),
                smSpacer(),
                const CategoryBar(
                  title: 'Popular Jobs',
                ),
                xxsSpacer(),
                PopularRow(data: data, size: size),
                xxsSpacer(),
                const CategoryBar(
                  title: 'Recent Jobs',
                ),
                xxsSpacer(),

                RecentColumn(data: data)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
