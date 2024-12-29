import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                onBoardingModel.image,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              onBoardingModel.title,
              style: AppStyles.cairoBold24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              onBoardingModel.subtitle,
              style: AppStyles.cairoRegular16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .25),
          ],
        ),
      ),
    );
  }
}
