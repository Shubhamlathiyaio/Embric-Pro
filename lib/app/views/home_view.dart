import 'package:embric/app/constants/app_colors.dart';
import 'package:embric/app/constants/app_images.dart';
import 'package:embric/app/controlles/nav_controller.dart';
import 'package:embric/app/models/navbar_tab_config.dart';
import 'package:embric/app/views/calculator_view.dart';
import 'package:embric/app/views/custom_bottom_nav_bar.dart';
import 'package:embric/app/views/design_list_view.dart';
import 'package:embric/app/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final NavController navController = Get.put(NavController());

  final List<Widget> _pages = [
    DesignListView(),
    CalculatorView(),
    SettingView(),
  ];

  final List<ItemConfig> _items = [
    ItemConfig(
      title: "Designs",
      icon: SvgPicture.asset(AppImage.svgIconPath),
      inactiveIcon: SvgPicture.asset(AppImage.svgIconPath),
      activeForegroundColor: AppColors.redColor,
    ),
    ItemConfig(
      title: "Home",
      icon: SvgPicture.asset(AppImage.svgIconPath),
      inactiveIcon: SvgPicture.asset(AppImage.svgIconPath),
      activeForegroundColor: AppColors.redColor,
    ),
    ItemConfig(
      title: "Settings",
      icon: SvgPicture.asset(AppImage.svgIconPath),
      inactiveIcon: SvgPicture.asset(AppImage.svgIconPath),
      activeForegroundColor: AppColors.redColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = navController.selectedIndex.value;

      return Scaffold(
        body: _pages[index],
        bottomNavigationBar: CustomBottomNavBar(
          items: _items,
          currentIndex: index,
          onItemSelected: (i) => navController.changeTab(i),
        ),
      );
    });
  }
}
