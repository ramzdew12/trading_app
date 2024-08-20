import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/constans/color/color_const.dart';
import 'package:trading_app/core/constans/icons/icon_const.dart';
import 'package:trading_app/features/main/cubit/main_cubit.dart';
import 'package:trading_app/features/main/state/main_state.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkBody,
      body: context
          .watch<MainCubit>()
          .pages[(context.watch<MainCubit>().state as MainInitialState).index],
      bottomNavigationBar: Container(
        height: 100,
        color: ColorConst.darkPurple,
        child: BottomNavigationBar(
            backgroundColor: ColorConst.darkPurple,
            selectedItemColor: ColorConst.white,
            unselectedItemColor: ColorConst.grey,
            currentIndex:
                (context.watch<MainCubit>().state as MainInitialState).index,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              context.read<MainCubit>().onBarTapChange(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconConst.home,
                ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconConst.portfolio,
                ),
                label: 'Portfolio'
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconConst.watchlist,
                ),
                label: 'Watchlist'
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconConst.trade,
                ),
                label: 'Trade'
              ),
            ]),
      ),
    );
  }
}
