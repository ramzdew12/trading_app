import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/model/tranding_model2.dart';
import 'package:trading_app/features/home/page/home_screen.dart';
import 'package:trading_app/features/main/state/main_state.dart';
import 'package:trading_app/features/search/page/search_page.dart';

class MainCubit extends Cubit<MainState> {
final TrandingModelSearch searchData;

  MainCubit(this.searchData) : super(MainInitialState());

  void onBarTapChange(int i) {
    emit(MainInitialState(index: i));
  }

  List<Widget> get pages => [
    HomeScreen(),
    Container(color: Colors.amber),
    Container(color: const Color.fromARGB(255, 22, 189, 17)),
    SearchPage(searchData: searchData)
  ];
}
