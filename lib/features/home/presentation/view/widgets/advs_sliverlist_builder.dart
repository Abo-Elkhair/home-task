import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task3/core/customs/custom_loading.dart';
import 'package:task3/core/utilities/res/app_colors.dart';
import 'package:task3/core/utilities/res/app_constants.dart';
import 'package:task3/features/home/data/home_model/adv.dart';
import 'package:task3/features/home/presentation/home_controller.dart';
import 'package:task3/features/home/presentation/view/widgets/reserved_or_display_more_btn.dart';

class AdvsSliverListBuilder extends StatelessWidget {
  const AdvsSliverListBuilder({super.key, required this.advList});
  final List<Adv> advList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: advList.length,
      itemBuilder: (context, i) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    height: 125,
                    width: double.infinity,
                    imageUrl: advList[i].images?[0].image ?? '',
                    placeholder: (context, url) =>
                        const Center(child: AppCircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  top: 10,
                  start: 10,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Icon(
                        advList[i].isFav ?? false
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 10,
                  end: 2,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          advList[i].category?.name ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Text(
                          advList[i].advertiserTypeText ?? '',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 12,
                    top: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            HomeController()
                                .daysSince(advList[i].createdAt ?? '0'),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              advList[i].title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7,
                          bottom: 12,
                        ),
                        child: Text(
                          advList[i].addressDetails ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              '${advList[i].price} ر.س',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                          // const Spacer(),
                          ...List.generate(
                            advList[i].options!.length > 2
                                ? 2
                                : advList[i].options!.length,
                            (index) => Row(
                              children: [
                                Container(
                                  margin: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 12,
                                  ),
                                  // if url is ' ' or error it give exception rather than put place holder or handle error , also when put tap on horizontal list
                                  child: CachedNetworkImage(
                                    imageUrl: advList[i]
                                            .options?[index]
                                            .image ??
                                        AppConstants.testNetworkImage, // ' '
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    placeholder: (context, url) => const Center(
                                        child: AppCircularProgressIndicator()),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Text(
                                  advList[i].options?[index].value ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${advList[i].totalArea} م2",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const ReserveOrDisplayMoreBtns()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
