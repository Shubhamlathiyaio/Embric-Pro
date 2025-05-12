import 'package:embric/app/views/calculator_view.dart';
import 'package:embric/app/views/design_list_view.dart';
import 'package:embric/app/views/home_view.dart';
import 'package:embric/app/views/setting_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.designList, page: () => DesignListView()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorView()),
    GetPage(name: AppRoutes.settings, page: () => SettingsView()),
  ];
}
