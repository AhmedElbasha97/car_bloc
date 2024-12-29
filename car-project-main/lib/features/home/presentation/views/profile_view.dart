import 'package:car_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/get_current_user.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: const Text(
          'Profile',
          style: AppStyles.cairoBold20,
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                getCurrentUser().email,
                style: AppStyles.cairoRegular16,
              ),
              Text(
                getCurrentUser().name,
                style: AppStyles.cairoRegular16,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
