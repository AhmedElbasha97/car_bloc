import 'package:car_project/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/password_field.dart';
import 'terms_and_conditions.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isTermsAccepted = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            hitnText: AppTexts.fullName,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: emailController,
            hitnText: AppTexts.email,
          ),
          const SizedBox(height: 16),
          PasswordField(
            controller: passwordController,
            hintText: AppTexts.password,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          TermsAncConditions(
            onChanged: (bool value) {
              setState(() {
                isTermsAccepted = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              child: GeneralButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAccepted) {
                      await context.read<RegisterCubit>().register(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          );
                    } else {
                      showSnackBar(
                        context,
                        AppTexts.pleaseAcceptTermsAndConditions,
                      );
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: AppTexts.createNewAccount,
                backgroundColor: isTermsAccepted
                    ? AppColors.primaryColor
                    : AppColors.greyColor,
                textColor: AppColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
