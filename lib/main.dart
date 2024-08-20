import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/model/search_data.dart';
import 'package:trading_app/features/home/cubit/home_cubit.dart';
import 'package:trading_app/features/main/cubit/main_cubit.dart';
import 'package:trading_app/features/main/page/main_screen.dart';
import 'package:trading_app/features/search/cubit/search_cubit.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => MainCubit(searchData), 
          ),
          BlocProvider(
            create: (context) => SearchCubit(searchData), 
          ),
        ],
        child: const MainScreen(),
      ),
    ),
  );
}
