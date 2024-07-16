import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';
import 'package:task3/core/utilities/res/app_images.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(14.0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.lightBlue,
            ),
            child: Image.asset(AppImages.setting),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'المدينة',
                fillColor: Colors.grey[100],
                filled: true,
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    AppImages.searchNormal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
