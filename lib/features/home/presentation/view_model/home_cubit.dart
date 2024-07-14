import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/network/dio_service.dart';
import 'package:task3/core/network/endpoints.dart';
import 'package:task3/features/home/data/home_model/home_model.dart';
import 'package:task3/features/home/presentation/view_model/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    DioService.getData(path: EndPoints.home).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      print(homeModel!.data?.userTypes?[0].name);
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(error: error.toString()));
    });
  }

  final SwiperController swiperController = SwiperController();
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  void onIndexChanged(int index) {
    currentIndex.value = index;
  }

  String daysSince(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final difference = now.difference(date);
    return 'منذ ${difference.inDays} أيام';
  }
}
