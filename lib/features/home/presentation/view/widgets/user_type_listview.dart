import 'package:flutter/material.dart';
import 'package:task3/features/home/presentation/view/widgets/user_type_btn.dart';
import 'package:task3/features/home/presentation/view_model/home_cubit.dart';

class UserTypeListview extends StatelessWidget {
  const UserTypeListview({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.homeModel?.data?.userTypes?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return UserTypeBtn(
            btnModel: BtnModel(
              btnName: cubit.homeModel?.data?.userTypes?[index].name ?? ' ',
              btnIndex: index,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 50,
        ),
      ),
    );
  }
}
