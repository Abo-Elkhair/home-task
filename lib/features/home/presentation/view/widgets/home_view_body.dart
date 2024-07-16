import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/blocs/generic_cubit/generic_cubit.dart';
import 'package:task3/core/customs/custom_loading.dart';
import 'package:task3/features/home/data/home_model/home_model_data.dart';
import 'package:task3/features/home/presentation/home_controller.dart';
import 'package:task3/features/home/presentation/view/widgets/advs_sliverlist_builder.dart';
import 'package:task3/features/home/presentation/view/widgets/custom_search_item.dart';
import 'package:task3/features/home/presentation/view/widgets/display_all_realstates_item.dart';
import 'package:task3/features/home/presentation/view/widgets/dots_indicator_item.dart';
import 'package:task3/features/home/presentation/view/widgets/home_main_appbar.dart';
import 'package:task3/features/home/presentation/view/widgets/swiper_item.dart';
import 'package:task3/features/home/presentation/view/widgets/user_type_listview.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final HomeController homeController;

  @override
  void initState() {
    homeController = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<HomeModelData?>,
        GenericState<HomeModelData?>>(
      bloc: homeController.homeCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        HomeMainAppBar(
                          onTapProfile: () {},
                          onTapMenu: () {},
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'صفة البائع',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        UserTypeListview(
                          listUserType: state.data?.userTypes ?? [],
                        ),
                        const SizedBox(height: 20.0),
                        const CustomSearchItem(),
                        const SizedBox(height: 20.0),
                        SwiperItem(
                          swiperController: homeController.swiperController,
                          banners: state.data?.banners ?? [],
                        ),
                        const SizedBox(height: 2.0),
                        DotsIndicatorItem(
                          banners: state.data?.banners ?? [],
                        ),
                        const SizedBox(height: 20.0),
                        const DisplayAllLatestRealstatesItem(),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  AdvsSliverListBuilder(
                    advList: state.data?.advs ?? [],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: AppCircularProgressIndicator());
        }
      },
    );
  }
}
