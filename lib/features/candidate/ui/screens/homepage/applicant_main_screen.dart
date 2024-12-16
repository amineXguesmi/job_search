import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_search/presentation/presentation.dart';

import '../settings/SettingScreen.dart';
import 'chat_home_screen.dart';
import 'filter_screen.dart';
import 'home_page.dart';

class ApplicantMainPage extends StatefulWidget {
  const ApplicantMainPage({super.key});

  @override
  State<ApplicantMainPage> createState() => _ApplicantMainPageState();
}

class _ApplicantMainPageState extends State<ApplicantMainPage> {
  int _selectedIndex = 0;

  List<Widget> applicantScreens = [
    const HomePage(),
    const FilterPage(),
    const ChatHomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: applicantScreens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          tabBackgroundColor: Colors.grey.shade500,
          gap: 8,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.sm, vertical: Dimensions.xxxs),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              backgroundColor: AppColors.primaryOrange,
              textStyle: TextStyles.buttonMedium(),
              iconSize: Dimensions.sm,
            ),
            GButton(
              icon: Icons.search,
              text: "Explore",
              backgroundColor: AppColors.pink,
              textStyle: TextStyles.buttonMedium(),
              iconSize: Dimensions.sm,
            ),
            GButton(
              key: const Key('chat'),
              icon: Icons.message,
              text: "Messages",
              backgroundColor: AppColors.lightPremiumColor,
              textStyle: TextStyles.buttonMedium(),
              iconSize: Dimensions.sm,
            ),
            GButton(
              key: const Key('settings'),
              icon: Icons.settings,
              text: "Settings",
              backgroundColor: Colors.blueAccent,
              textStyle: TextStyles.buttonMedium(),
              iconSize: Dimensions.sm,
            ),
          ],
        ),
      ),
    );
  }
}
