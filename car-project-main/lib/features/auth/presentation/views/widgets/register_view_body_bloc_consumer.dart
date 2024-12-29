import 'package:car_project/core/functions/show_snack_bar.dart';
import 'package:car_project/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../manager/register_cubit/register_cubit_state.dart';
import 'register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          Navigator.pushNamed(context, AppRoutes.home);
        }
        if (state is RegisterCubitError) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterCubitLoading,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: RegisterViewBody(),
        );
      },
    );
  }
}
