import 'package:car_project/features/home/presentation/manager/get_car_cubit/get_car_cubit.dart';
import 'package:car_project/features/home/presentation/manager/get_car_cubit/get_car_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_card.dart';

class HomeViewBodyBlocBuilder extends StatefulWidget {
  const HomeViewBodyBlocBuilder({
    super.key,
  });

  @override
  State<HomeViewBodyBlocBuilder> createState() =>
      _HomeViewBodyBlocBuilderState();
}

class _HomeViewBodyBlocBuilderState extends State<HomeViewBodyBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetCarCubit>(context).getCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCarCubit, GetCarCubitState>(
      builder: (context, state) {
        if (state is GetCarCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetCarCubitSuccess) {
          return ListView.builder(
            itemCount: state.cars.length,
            itemBuilder: (context, index) {
              return CarCard(car: state.cars[index]);
            },
          );
        } else if (state is GetCarCubitError) {
          return Center(
            child: Text('error : ${state.error}'),
          );
        }
        return Container();
      },
    );
  }
}
