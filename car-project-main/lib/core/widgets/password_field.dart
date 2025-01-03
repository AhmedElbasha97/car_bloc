import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/app_texts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
  });
  final String? hintText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        obscureText: isPasswordVisible,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        validator: (data) {
          if (data!.isEmpty) {
            return AppTexts.fieldIsRequired;
          }
          return null;
        },
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              isPasswordVisible = !isPasswordVisible;
              setState(() {});
            },
            icon: isPasswordVisible
                ? Icon(
                    Icons.visibility,
                    color: AppColors.greyColor.withAlpha(128),
                  )
                : Icon(
                    Icons.visibility_off,
                    color: AppColors.greyColor.withAlpha(128),
                  ),
          ),
          hintText: widget.hintText,
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
