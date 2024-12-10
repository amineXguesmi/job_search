import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Primary colors

  static const Color background = Color(0xFFF6F6F6);

  static const Color greyColor = Color(0xFFAFAFAF);
  static const Color greyShade150 = Color(0xFFF0F0F0);

  static  MaterialColor primaryOrange = MaterialColor(
    0xFFFF9800,
    <int, Color>{
      800: Colors.orange.shade800,
      600: Colors.orange.shade600,
      400: Colors.orange.shade400,
      200: Colors.orange.shade200,
    },
  );

  static const MaterialColor primaryAccent = MaterialColor(
    0xFFF29191,
    <int, Color>{
      800: Color(0xCCF29191),
      600: Color(0x99F29191),
      400: Color(0x66F29191),
      200: Color(0x33F29191),
    },
  );

  //Secondary colors

  static const MaterialColor secondaryPurple = MaterialColor(
    0xFF7971B3,
    <int, Color>{
      800: Color(0xCC7971B3),
      600: Color(0x997971B3),
      400: Color(0x667971B3),
      200: Color(0x337971B3),
    },
  );

  static const MaterialColor secondaryAccent = MaterialColor(
    0xFFF8C6C8,
    <int, Color>{
      800: Color(0xCCF8C6C8),
      600: Color(0x99F8C6C8),
      400: Color(0x66F8C6C8),
      200: Color(0x33F8C6C8),
    },
  );

  //Premium colors

  static const Color primaryPremiumColor = Colors.orange;
  static const Color lightPremiumColor = Color(0xFF675CB4);
  static const Color secondaryPremiumColor = Color(0xFFFABB57);
  static const Color goldPremiumColor = Color(0xFFD0B25B);
  static const Color darkGoldPremiumColor = Color(0xFFFCB13C);
  static const Color lightGoldPremiumColor = Color(0xFFF1D7AE);
  static const Color astrologyExtraLight = Color(0xFFA2CDE9);
  static const Color boostColor = Color(0xFF087BD5);
  static const Color astrologyDark = Color(0xff02132f);
  static const Color selectPictureBackgroundColor = Color(0xFFd6d4ea);

  static const Color primaryPremiumColorLight = Color(0xff9594bd);

  static const primaryPremiumGradient = [primaryPremiumColor, primaryPremiumColorLight];

  // Naturel colors
  static const Color backgroundWhiteColor = Color(0xFFF6F6F6);

  static const Color whitish = Color(0xFFF6F6F6);
  static const MaterialColor black = MaterialColor(
    0xFF2B2B2B,
    <int, Color>{
      900: Color(0xFF0F0F0F),
      800: Color(0xFF2B2B2B),
      700: Color(0xFF474747),
      600: Color(0xFF636363),
      500: Color(0xFF7F7F7F),
      400: Color(0xFF9C9C9C),
      300: Color(0xFFB8B8B8),
      200: Color(0xFFD4D4D4),
      100: Color(0xFFF0F0F0),
      50: Color(0xFFF0F0F0),
    },
  );

  // States colors

  static const Color success = Color(0xFF30D200);
  static const Color notification = Color(0xFFF85358);
  static const Color error = Color(0xFFDA1414);
  static const Color premium = Color(0xFFF9BA56);
  static const Color perks = Color(0xFFA2CDE9);
  static const Color verification = Color(0xFF4A87FF);
  static const Color spark = Color(0xFFB241F1);
  static const Color indicator = Color(0xFF5C5EA5);
  static const Color astrologyLight = Color(0xff28254f);
  static const Color darkShadeBlue = Color(0xFF1157C9);
  static const Color pink = Color(0xFFF49090);
  static const Color mainColorLight = Color(0xff9594bd);
  static const Color requestBirthColor = Color(0xff2ea0ea);
  static const Color whoLikedMeColorShade = Color(0x00D9D9D9);
  static const Color errorColor = Color(0xFFEF5350);

  // DNA Category Gradients

  static const hobbiesAndIntersts = [Color(0xFF5E569B), Color(0xE85E569B)];
  static const valuesPointsOfView = [Color(0xFF7971B3), Color(0xFFD5D4EA)];
  static const lifestyleAndHabits = [Color(0xFFA2CDE9), Color(0x7FA2CDE9)];
  static const emotionsAndAttitudes = [Color(0x00F49090), Color(0x7FF49090)];
  static const progressIndicatorGradient = [Color(0xFFD5D4EA), Color(0x7FF49090)];
  static const loveLanguage = [Color(0xFFF85358), Color(0x7FF85358)];
  static const sparkGradient = [
    Color(0xFF8c13b9),
    Color(0xFFc17ce9),
  ];
  static const List<Color> sliderGradientInScience = [Color(0xFFd6d4ea), Color(0xfff29191)];

  // Other Gradients
  static const incognitoBackgroundGradient = [Color(0xff274CA5), Color(0xffA72E89)];
  static const purpleBackgroundGradiant = [Color(0x7971B3B2), Color(0x7971B3B2)];
  static const purpleWidgetGradiant = [Color(0xFF3F3778), Color(0x003F3778)];
  static const purpleTop3cardGradiant = [Color(0x003F3778), Color(0xFF3F3778)];
  static const purpleGradient = [Color(0xFF7971B3), Color(0xFF453D7E)];
  static const premiumGradiant = [Color(0xFF3F3778), Color(0xFF7971B3)];
  static const accentGradient = [Color(0x00F29191), Color(0xFFF8C6C8)];
  static const combiniationGradient = [Color(0xFFD5D4EA), Color(0xFFD5D4EA)];
  static const splashAndLogin = [Color(0xFF4C4584), Color(0xFF7971B3)];
  static const interestsGradient = [primaryPremiumColor, Color(0xFF9594BD)];
  static const firstInterestCategoryGradient = [Color(0xFF7971B3), Color(0xFFD6D4EA)];
  static const secondInterestCategoryGradient = [Color(0xFFF29191), Color(0x007971B3)];
  static const selectedSecondInterestCategoryGradient = [Color(0xFFF29191), Color(0xFF7971B3)];
  static const thirdInterestCategoryGradient = [Color(0xFF7971B3), Color(0xFFF85358)];
  static const psychologyGradient = [
    Color(0xFF5C5EA5),
    Color(0xFF797BC3),
  ];
  static const astrologyBlueShade = [Colors.transparent, Color.fromRGBO(6, 9, 80, 0.4), Color.fromRGBO(6, 9, 80, 0.9)];
  static const scienceRedShade = [
    Colors.transparent,
    // Color.fromRGBO(135, 12, 66, 0.1),
    // Color.fromRGBO(68, 6, 33, 0.28),
    // Color.fromRGBO(135, 12, 66, 0.3),
    Color(0x803f3778),
  ];

  static const astrologyGradient = [astrologyDark, astrologyLight];

  static const notificationGradient = [
    Color(0xFF5E569B),
    Color(0xFF7971B3),
    Color(0xA0A09CCC),
    Color(0x00CACBE6),
  ];

  static const List<Color> sparkShadeSmall = [
    Color(0x00B241F1),
    Color(0x32B241F1),
    Color(0x64B241F1),
    Color(0x80B241F1),
  ];

  // Who I liked Colors
  static const firstCategory = [
    Color(0xCC7971B3),
    Color(0x997971B3),
    Color(0xFF7971B3),
  ];
  static const secondCategory = [Color(0x997971B3), Color(0x667971B3), Color(0xFF7971B3)];
  static const thirdCategory = [Color(0xCCF29191), Color(0x99F29191), Color(0xFFF29191)];
  static const forthCategory = [Color(0xCCF8C6C8), Color(0x99F8C6C8), Color(0xFFF8C6C8)];

  static final loginGradient = [
    Colors.orange.shade900,
    Colors.orange.shade800,
    Colors.orange.shade400
  ];
}
