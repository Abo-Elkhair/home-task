import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task3/core/widgets/app_circular_progress_indicator.dart';
import 'package:task3/features/home/presentation/view/widgets/advs_sliverlist_builder.dart';
import 'package:task3/features/home/presentation/view/widgets/custom_search_item.dart';
import 'package:task3/features/home/presentation/view/widgets/display_all_realstates_item.dart';
import 'package:task3/features/home/presentation/view/widgets/dots_indicator_item.dart';
import 'package:task3/features/home/presentation/view/widgets/home_main_appbar.dart';
import 'package:task3/features/home/presentation/view/widgets/swiper_item.dart';
import 'package:task3/features/home/presentation/view/widgets/user_type_listview.dart';
import 'package:task3/features/home/presentation/view_model/home_cubit.dart';
import 'package:task3/features/home/presentation/view_model/home_states.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HomeMainAppBar(
                        onTapProfile: () {},
                        onTapMenu: () {},
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'صفة البائع',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      UserTypeListview(cubit: cubit),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CustomSearchItem(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SwiperItem(
                        cubit: cubit,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      DotsIndicatorItem(cubit: cubit),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DisplayAllLatestRealstatesItem(
                        cubit: cubit,
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
                AdvsSliverListBuilder(cubit: cubit),
              ]),
            ),
          );
        } else if (state is HomeErrorState) {
          return Text(state.error);
        } else {
          return const Center(child: AppCircularProgressIndicator());
        }
      },
    );
  }
}
