import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_texts.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnBoardingModel> onBoardingModels = [
  OnBoardingModel(
    image: AppAssets.imagesImage1onboarding,
    title: AppTexts.onBoardingTitle1,
    subtitle: AppTexts.onBoardingSubtitle1,
  ),
  OnBoardingModel(
    image: AppAssets.imagesImage1onboarding,
    title: AppTexts.onBoardingTitle2,
    subtitle: AppTexts.onBoardingSubtitle2,
  ),
  OnBoardingModel(
    image: AppAssets.imagesImage1onboarding,
    title: AppTexts.onBoardingTitle3,
    subtitle: AppTexts.onBoardingSubtitle3,
  ),
];
