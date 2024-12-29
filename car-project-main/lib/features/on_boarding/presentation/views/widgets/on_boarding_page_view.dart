import 'package:car_project/features/on_boarding/presentation/views/widgets/on_boarding_page_view_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/on_boarding_model.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: onBoardingModels.length,
      itemBuilder: (BuildContext context, int index) {
        return OnBoardingPageViewItem(
          onBoardingModel: onBoardingModels[index],
        );
      },
    );
  }
}
