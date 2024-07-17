import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:task3/core/blocs/generic_cubit/generic_cubit.dart';
import 'package:task3/core/utilities/utilities/http/home_data_source.dart';
import 'package:task3/features/home/data/home_model/home_model_data.dart';

class HomeController {
  HomeController._() {
    initData();
  }

  static final HomeController _instance = HomeController._();

  factory HomeController() => _instance;

  late GenericBloc<HomeModelData?> homeCubit;
  late SwiperController swiperController;
  late ValueNotifier<int> currentIndex;

  void initData() {
    homeCubit = GenericBloc<HomeModelData?>(null);
    swiperController = SwiperController();
    currentIndex = ValueNotifier<int>(0);
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    final result = await HomeDataSource().getHomeData();
    homeCubit.onUpdateData(result);
  }

  void onIndexChanged(int index) {
    currentIndex.value = index;
  }

  String daysSince(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final difference = now.difference(date);
    return 'منذ ${difference.inDays} أيام';
  }

  /// This function is okay, but we can also use extension here / public class like
  /// utils.
  /// example:
  /// extension DateDifference on DateTime {
  ///  String daysSince(DateTime date) {.....}
  ///}
  /// and then we can use it like this:
  /// final difference = now.daysSince(date);
}
