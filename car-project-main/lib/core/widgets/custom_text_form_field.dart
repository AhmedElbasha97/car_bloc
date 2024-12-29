import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/app_texts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.hitnText,
    this.controller,
    this.textInputType = TextInputType.text,
  });
  final String? hitnText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        keyboardType: textInputType,
        controller: controller,
        validator: (data) {
          if (data!.isEmpty) {
            return AppTexts.fieldIsRequired;
          }
          return null;
        },
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hitnText,
          floatingLabelStyle: AppStyles.cairoRegular16,
          hintStyle:
              AppStyles.cairoRegular16.copyWith(color: AppColors.greyColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.greyColor.withAlpha(128)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.greyColor.withAlpha(128)),
          ),
        ),
      ),
    );
  }
}
