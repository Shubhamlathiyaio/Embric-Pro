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
    SettingsView(),
  ];

  final List<ItemConfig> _items = [
    ItemConfig(
      title: "Designs".tr,
      icon: SvgPicture.asset(AppImage.listA),
      inactiveIcon: SvgPicture.asset(AppImage.list),
      activeForegroundColor: AppColors.primaryColor,
    ),
    ItemConfig(
      title: "Calculator".tr,
      icon: SvgPicture.asset(AppImage.homeA),
      inactiveIcon: SvgPicture.asset(AppImage.home),
      activeForegroundColor: AppColors.primaryColor,
    ),
    ItemConfig(
      title: "Settings".tr,
      icon: SvgPicture.asset(AppImage.settingsA),
      inactiveIcon: SvgPicture.asset(AppImage.settings),
      activeForegroundColor: AppColors.primaryColor,
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
