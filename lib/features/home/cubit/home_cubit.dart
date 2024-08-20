import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/repository/trading_app_repository.dart';
import 'package:trading_app/features/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeLoading());

  Future<void> fetchMarketTrends() async {
    try {
      final result = await TradingAppRepository.instance.getMarketTrends();
      print('Fetched data: $result');
      emit(HomeSuccess(trandingModels: result));
    } catch (e) {
      print('Error fetching data: $e');
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}