import 'package:car_project/core/utils/app_assets.dart';
import 'package:car_project/core/utils/app_styles.dart';
import 'package:car_project/features/home/presentation/manager/get_car_cubit/get_car_cubit.dart';
import 'package:car_project/features/home/presentation/views/widgets/home_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import 'message_list/chating_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCarCubit(),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(AppAssets.imagesUser),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 42,
                ),
                title: Text(
                  'Proflie',
                  style: AppStyles.cairoRegular16.copyWith(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.profile);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, size: 42),
                title: Text(
                  'Logout',
                  style: AppStyles.cairoRegular16.copyWith(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),ListTile(
                leading: const Icon(Icons.chat, size: 42),
                title: Text(
                  'Costumer care',

                  style: AppStyles.cairoRegular16.copyWith(fontSize: 20),
                ),
                onTap: () {
                  Get.to(()=> ChattingScreen(receiverId: '1', receiverType: 'STUDENT', receiverName: 'Costumer Care',));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Choose Your Car'),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: HomeViewBodyBlocBuilder(),
      ),
    );
  }
}
