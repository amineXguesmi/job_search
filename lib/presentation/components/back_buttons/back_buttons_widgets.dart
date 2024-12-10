import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../presentation.dart';

Widget backButton(
    double deviceWidth,
    double deviceHeight, {
      bool isPremium = false,
      bool isWhite = false,
      EdgeInsets? padding,
      isInMatchesScreen = false,
    }) {
  return Padding(
    padding: padding ??
        EdgeInsets.only(
          left: isPremium ? deviceWidth * 0.01 : deviceWidth * 0.03,
          top: isInMatchesScreen ? deviceHeight * 0.006 : (isPremium ? deviceHeight * 0.005 : 0),
        ),
    child: Container(
      height: Dimensions.xmd,
      width: Dimensions.xmd,
      decoration: BoxDecoration(
        color: isWhite
            ? Colors.white
            : isPremium
            ? Colors.transparent
            : AppColors.primaryPremiumColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(deviceWidth * 0.1),
      ),
      padding: const EdgeInsets.all(6),
      child: FittedBox(
        child: Icon(
          FontAwesomeIcons.chevronLeft,
          color: isPremium ? Colors.white : AppColors.primaryPremiumColor,
        ),
      ),
    ),
  );
}

Widget backToHomeButton({
  required double deviceWidth,
  required double deviceHeight,
  bool isDarkIcon = false,
}) {
  final Widget lightButton = Container(
    height: 34,
    width: 34,
    decoration: BoxDecoration(
      color: AppColors.primaryPremiumColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(deviceWidth * 0.1),
    ),
    padding: const EdgeInsets.all(10),
    child: FittedBox(
      child: Image.asset(Assets.homeIconWhite),
    ),
  );

  final Widget darkButton = Image.asset(
    Assets.homeIconDark,
    height: Dimensions.xlg,
    width: Dimensions.xlg,
  );

  return isDarkIcon ? darkButton : lightButton;
}

Widget nextButton(double deviceWidth, double deviceHeight, {bool isPremium = false}) {
  return Container(
    height: deviceWidth * 0.09,
    width: deviceWidth * 0.09,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: isPremium ? Colors.transparent : Colors.grey.withOpacity(0.7),
          offset: const Offset(0.0, 1.0),
          blurRadius: 10.0,
        ),
      ],
      color: isPremium ? Colors.transparent : Colors.white,
      borderRadius: BorderRadius.circular(deviceWidth * 0.1),
    ),
    margin: EdgeInsets.only(
      left: isPremium ? deviceWidth * 0.01 : deviceWidth * 0.03,
      top: isPremium ? deviceHeight * 0.005 : 0,
    ),
    child: Center(
      child: Icon(
        FontAwesomeIcons.chevronRight,
        color: isPremium ? Colors.white : Colors.black,
        size: deviceWidth * 0.045,
      ),
    ),
  );
}

Widget closeButton(double deviceWidth, double deviceHeight) {
  return Container(
    height: deviceWidth * 0.09,
    width: deviceWidth * 0.09,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          offset: const Offset(0.0, 1.0),
          blurRadius: 10.0,
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(deviceWidth * 0.1),
    ),
    margin: EdgeInsets.only(left: deviceWidth * 0.03, top: deviceHeight * 0.005),
    child: Center(
      child: Icon(
        FontAwesomeIcons.xmark,
        color: Colors.black,
        size: deviceWidth * 0.045,
      ),
    ),
  );
}
