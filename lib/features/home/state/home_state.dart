import 'package:trading_app/core/model/tranding_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}

class HomeSuccess extends HomeState {
  final List<TrandingModel> trandingModels; 

  HomeSuccess({required this.trandingModels});
}
