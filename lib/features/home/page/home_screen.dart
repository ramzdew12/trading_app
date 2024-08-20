import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/core/constans/color/color_const.dart';
import 'package:trading_app/core/constans/font/font_style_const.dart';
import 'package:trading_app/core/constans/icons/icon_const.dart';
import 'package:trading_app/features/home/cubit/home_cubit.dart';
import 'package:trading_app/features/home/state/home_state.dart';
import 'package:trading_app/features/home/widgets/menu_side_bar.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchMarketTrends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkBody,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorConst.darkPurple,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Hero(
            tag: 'menu',
            child: IconButton(
              icon: SvgPicture.asset(IconConst.menu),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MenuSideBar())),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              child: SvgPicture.asset(
                IconConst.search,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: ColorConst.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconConst.notifications),
                    const SizedBox(width: 8),
                    RichText(
                      text: const TextSpan(
                        text: 'You have to ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'update ',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: 'your information!',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ));
                } else if (state is HomeError) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else if (state is HomeSuccess) {
                  final trandingModels = state.trandingModels;
                  double profitLoss = trandingModels.first.price -
                      trandingModels.first.previousClose;
                  String profitLossText = profitLoss >= 0
                      ? "+\$${profitLoss.toStringAsFixed(2)}"
                      : "-\$${(-profitLoss).toStringAsFixed(2)}";
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(IconConst.chizigAnaliz),
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomRight),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: ColorConst.white,
                            width: 1,
                          ),
                          color: ColorConst.darkPurple,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Wellcome ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'William, ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'your information!',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  IconConst.tepapas,
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                                '\$${trandingModels.first.price.toStringAsFixed(2)}',
                                style: FontStyleConst.big
                                    .copyWith(color: ColorConst.white)),
                            Text(
                              "Position P/L: $profitLossText",
                              style: TextStyle(
                                color:
                                    profitLoss >= 0 ? Colors.green : Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 120,
                              height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: ColorConst.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Make a deposit',
                                style: FontStyleConst.small
                                    .copyWith(color: ColorConst.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My positions",
                                style: FontStyleConst.big
                                    .copyWith(color: ColorConst.white)),
                            Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ColorConst.darkPurple,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      SvgPicture.asset(IconConst.chevronRight),
                                ))
                          ])
                    ],
                  );
                } else {
                  return const Center(child: Text('No data'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
