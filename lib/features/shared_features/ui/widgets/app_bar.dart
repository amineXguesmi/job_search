import 'package:flutter/material.dart';
import 'package:job_search/presentation/presentation.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        const Padding(
          padding: EdgeInsets.only(left: Dimensions.xxxs),
          child: Text(
            "Creative Jobs",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw")),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15)),
        )
      ],
    );
  }
}
