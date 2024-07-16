import 'package:flutter/material.dart';
import 'package:task3/features/home/data/home_model/user_type.dart';
import 'package:task3/features/home/presentation/view/widgets/user_type_btn.dart';

class UserTypeListview extends StatelessWidget {
  const UserTypeListview({
    super.key,
    required this.listUserType,
  });

  final List<UserType> listUserType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listUserType.length,
        itemBuilder: (BuildContext context, int index) {
          return UserTypeBtn(
            btnModel: BtnModel(
              btnName: listUserType[index].name ?? ' ',
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
