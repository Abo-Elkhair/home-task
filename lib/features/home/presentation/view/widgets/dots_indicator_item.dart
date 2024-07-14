import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task3/core/utils/app_colors.dart';
import 'package:task3/features/home/presentation/view_model/home_cubit.dart';

class DotsIndicatorItem extends StatelessWidget {
  const DotsIndicatorItem({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cubit.currentIndex,
      builder: (context, value, child) => Align(
        child: DotsIndicator(
          onTap: (index) {},
          dotsCount: cubit.homeModel?.data?.banners?.length ?? 0,
          position: value,
          decorator: DotsDecorator(
            activeColor: AppColors.lightBlue,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
