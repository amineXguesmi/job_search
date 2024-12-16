import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_search/features/candidate/ui/screens/settings/professional_info_screen.dart';
import 'package:job_search/features/candidate/ui/screens/settings/work_info_screen.dart';

import '../../../../../presentation/presentation.dart';
import '../job/AppliedJobsScreen.dart';
import '../job/SavedJobScreen.dart';
import 'basic_info_screen.dart';
import 'change_password_screen.dart';
import 'education_info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var notifyHelper;
  bool isDarkMode = false;
  late String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyles.title2Semibold(color: Colors.black),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  key: const Key("darkModeSlider"),
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.lato().fontFamily),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      key: const Key("darkModeSwitch"),
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                        // notifyHelper.scheduledNotification();
                      }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.primaryOrange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Account",
                  style: TextStyles.title2Semibold(color: Colors.black),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSettingOption(
              title: "Basic Info",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditBasicInfoScreen(),
                  ),
                );
              },
            ),
            BuildSettingOption(
                title: "Professional Info",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfessionalInfoScreen(),
                    ),
                  );
                }),
            BuildSettingOption(
                title: "Educational Records",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditEducationalInfoScreen(),
                    ),
                  );
                }),
            BuildSettingOption(
                title: "Experience Records",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditWorkInfoScreen(),
                    ),
                  );
                }),
            BuildSettingOption(
                title: "Change Password",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person_pin,
                  color: AppColors.primaryOrange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text("Personal Space", style: TextStyles.title2Semibold()),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSettingOption(
                title: "My Events",
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const EventsScreen(),
                  //   ),
                  // );
                }),
            BuildSettingOption(
                title: "My ToDos",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const TodoScreen(),
                  //   ),
                  // );
                }),
            BuildSettingOption(
                title: "Applied Jobs",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppliedJobScreen(),
                    ),
                  );
                }),
            BuildSettingOption(
                title: "Saved Jobs",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedJobScreen(),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () async {
                // SharedPreferences pref = await SharedPreferences.getInstance();
                // pref.clear();
                // Get.offAll(const LoginScreen());
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2.2,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildSettingOption extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  Function()? onPressed;

  BuildSettingOption({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: GoogleFonts.lato().fontFamily),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.primaryOrange),
          ],
        ),
      ),
    );
  }
}
