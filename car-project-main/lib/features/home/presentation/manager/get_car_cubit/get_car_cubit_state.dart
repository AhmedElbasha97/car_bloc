import '../../../data/car_model.dart';

abstract class GetCarCubitState {}

class GetCarCubitInitial extends GetCarCubitState {}

class GetCarCubitLoading extends GetCarCubitState {}

class GetCarCubitSuccess extends GetCarCubitState {
  final List<CarModel> cars;

  GetCarCubitSuccess({required this.cars});
}

class GetCarCubitError extends GetCarCubitState {
  final String error;

  GetCarCubitError({required this.error});
}
  