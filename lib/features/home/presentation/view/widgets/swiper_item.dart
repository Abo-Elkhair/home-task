import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:task3/core/utils/app_colors.dart';
import 'package:task3/features/home/presentation/view_model/home_cubit.dart';

class SwiperItem extends StatelessWidget {
  const SwiperItem({super.key, required this.cubit});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Swiper(
            controller: cubit.swiperController,
            itemCount: cubit.homeModel?.data?.banners?.length ?? 0,
            onIndexChanged: cubit.onIndexChanged,
            autoplay: true,
            loop: true,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          cubit.homeModel?.data?.banners?[index].image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                                bottomLeft: Radius.circular(24.0),
                              ),
                            ),
                            child: const Text(
                              'امتلك عقارك',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'الان فى المملكة العربية السعودية',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
