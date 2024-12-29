import 'package:car_project/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/repos/auth_repo.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepo>(),
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
