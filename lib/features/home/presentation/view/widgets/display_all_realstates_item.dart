import 'package:flutter/material.dart';
import 'package:task3/core/utils/app_colors.dart';
import 'package:task3/features/home/presentation/view_model/home_cubit.dart';

class DisplayAllLatestRealstatesItem extends StatelessWidget {
  const DisplayAllLatestRealstatesItem({
    super.key,
    required this.cubit,
  });
  final HomeCubit cubit;
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
