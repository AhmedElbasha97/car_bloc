import 'package:flutter/material.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/widgets/general_button.dart';
import 'top_login_or_register_section.dart';

class LoginOrRegisterViewBody extends StatelessWidget {
  const LoginOrRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          const TopLoginOrRegisterSection(),
          SizedBox(height: MediaQuery.of(context).size.height * .05),

          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(AppAssets.imagesImage1onboarding),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1),

          GeneralButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.login);
            },
            text: AppTexts.login,
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          const SizedBox(height: 15),
          //? I put container to give the button border color
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: GeneralButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.register);
              },
              text: AppTexts.register,
              backgroundColor: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
