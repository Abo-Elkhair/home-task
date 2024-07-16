import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';

class BtnModel {
  final String btnName;
  final int btnIndex;

  BtnModel({required this.btnName, required this.btnIndex});
}

class UserTypeBtn extends StatelessWidget {
  const UserTypeBtn({
    super.key,
    required this.btnModel,
  });
  final BtnModel btnModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text(
                  btnModel.btnName,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.grey, width: 0.5),
        ),
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            btnModel.btnName,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
