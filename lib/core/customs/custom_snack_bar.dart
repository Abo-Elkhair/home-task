import 'package:flutter/material.dart';
import 'package:task3/core/utilities/res/app_colors.dart';

void showSnackBar(String message,
    {Color? backgroundColor, TickerProviderStateMixin? vsync}) {
  SnackBar(
    content: Text(
      message,
    ),
    backgroundColor: backgroundColor ?? AppColors.black.withOpacity(.5),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
