import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../presentation/presentation.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.xxxs),
          child: Text(
            title,
            style: TextStyles.title2Medium(),
          ),
        ),
        Text(
          "Show All",
          style: TextStyles.calloutMedium(color: Colors.grey.shade700),
        )
      ],
    );
  }
}
