import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';
import 'package:task3/core/utilities/res/app_images.dart';

class HomeMainAppBar extends StatelessWidget {
  final void Function() onTapMenu;
  final void Function() onTapProfile;
  const HomeMainAppBar({
    super.key,
    required this.onTapMenu,
    required this.onTapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: onTapMenu, child: Image.asset(AppImages.menu)),
        const Spacer(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'مرحبا بك',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'احمد عصام',
              style: TextStyle(fontSize: 10, color: AppColors.grey),
            )
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTapProfile,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.testImage),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
