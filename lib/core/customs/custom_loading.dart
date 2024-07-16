import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.lightBlue,
    );
  }
}
