import 'package:car_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const TextStyle cairoBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static const TextStyle cairoRegular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static const TextStyle cairoRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static const TextStyle cairoBold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static const TextStyle cairoBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
}
