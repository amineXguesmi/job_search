import 'package:flutter/material.dart';

import '../../../../presentation/presentation.dart';

class GreetingsText extends StatelessWidget {
  const GreetingsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Good Morning Alexa",
          style: TextStyles.buttonMedium(color: Colors.grey.shade600),
        ),
        xxxsSpacer(),
        Text(
          "Find Your Creative Job",
          style: TextStyles.title2Medium(color: Colors.black),),
      ],
    );
  }
}