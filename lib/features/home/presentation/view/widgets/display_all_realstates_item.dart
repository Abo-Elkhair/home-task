import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';

class DisplayAllLatestRealstatesItem extends StatelessWidget {
  const DisplayAllLatestRealstatesItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text('رؤية الكل',
              style: TextStyle(color: AppColors.lightBlue)),
        ),
        const Spacer(),
        const Text(
          'احدث العقارات',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
