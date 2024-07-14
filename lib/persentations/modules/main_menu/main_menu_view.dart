// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/persentations/modules/home/home_view.dart';
import 'package:pdam_inventory/persentations/modules/profile/profile_view.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  int currentIndex = 0;

  List<Widget> listPage = [
    const HomeView(),
    const Center(
      child: Text("Barang/Produk"),
    ),
    const ProfileView(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: ColorApp.greyF4,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorApp.blackText,
      unselectedItemColor: ColorApp.greyText,
      selectedLabelStyle: StyleApp.textSm.copyWith(
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: StyleApp.textSm.copyWith(
        color: ColorApp.greyText,
      ),
      elevation: 2,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconApp.home,
            color: currentIndex == 0 ? ColorApp.blackText : ColorApp.greyText,
          ),
          label: StringApp.home,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconApp.box2,
            color: currentIndex == 1 ? ColorApp.blackText : ColorApp.greyText,
          ),
          label: StringApp.itemOrProduct,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconApp.profile,
            color: currentIndex == 2 ? ColorApp.blackText : ColorApp.greyText,
          ),
          label: StringApp.profile,
        ),
      ],
    );
  }
}
