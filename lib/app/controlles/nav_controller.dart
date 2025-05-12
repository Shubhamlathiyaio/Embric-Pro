import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 1.obs; // Default to Home page

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
