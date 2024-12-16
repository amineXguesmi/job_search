import 'package:flutter/material.dart';
import 'package:job_search/presentation/theme/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  var isUpdating = false;

  MyButton({Key? key, required this.label, required this.onTap, this.isUpdating = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: isUpdating
                ? const CircularProgressIndicator()
                : Text(label, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700))),
      ),
    );
  }
}
