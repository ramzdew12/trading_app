import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/core/constans/color/color_const.dart';
import 'package:trading_app/core/constans/font/font_style_const.dart';
import 'package:trading_app/core/constans/icons/icon_const.dart';

class MenuSideBar extends StatelessWidget {
  const MenuSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: 'menu',
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(IconConst.chevronBack),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.account,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 20),
                  Text('Account',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.deposits,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 15),
                  Text('Deposits & transfers',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.research,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 28),
                  Text('Research center',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.settings,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 22),
                  Text('Settings',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.help,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 22),
                  Text('Help center',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const Divider(
                color: Color.fromARGB(255, 105, 105, 105),
                thickness: 1.0,
                height: 50,
              ),
              Text('Corporate actions',
                  style:
                      FontStyleConst.small.copyWith(color: ColorConst.white)),
              const SizedBox(height: 20),
              Text('Insights',
                  style:
                      FontStyleConst.small.copyWith(color: ColorConst.white)),
              const SizedBox(height: 20),
              Text('Inbox',
                  style:
                      FontStyleConst.small.copyWith(color: ColorConst.white)),
              const SizedBox(height: 20),
              Text('Mifid status',
                  style:
                      FontStyleConst.small.copyWith(color: ColorConst.white)),
              const SizedBox(height: 80),
              const Divider(
                color: Color.fromARGB(255, 105, 105, 105),
                thickness: 1.0,
                height: 50,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    IconConst.logout,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 22),
                  Text('Log out',
                      style: FontStyleConst.medium
                          .copyWith(color: ColorConst.white)),
                ],
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconConst.dickklaimer,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 12),
                        Text('Disclaimer',
                            style: FontStyleConst.small2
                                .copyWith(color: const Color.fromARGB(255, 69, 131, 182))),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconConst.dickklaimer,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 12),
                        Text('Terms & conditions',
                            style: FontStyleConst.small2
                                .copyWith(color: const Color.fromARGB(255, 69, 131, 182))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
