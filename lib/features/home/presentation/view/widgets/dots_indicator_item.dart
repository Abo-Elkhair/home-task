import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';
import 'package:task3/features/home/data/home_model/banner.dart';
import 'package:task3/features/home/presentation/home_controller.dart';

class DotsIndicatorItem extends StatelessWidget {
  const DotsIndicatorItem({
    super.key,
    required this.banners,
  });
  final List<Banners> banners;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeController().currentIndex,
      builder: (context, value, child) => Align(
        child: DotsIndicator(
          onTap: (index) {},
          dotsCount: banners.length,
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
