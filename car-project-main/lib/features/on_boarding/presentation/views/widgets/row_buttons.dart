import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';
import 'custom_on_boarding_button.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, AppRoutes.loginOrRegister);
            },
            text: AppTexts.skip,
            backgroundColor: AppColors.whiteColor,
            textColor: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            },
            text: AppTexts.next,
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
