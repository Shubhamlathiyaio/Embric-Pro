import 'package:embric/app/constants/app_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Observable variable to hold the theme mode
  var isDarkMode = (ThemeMode.system == ThemeMode.dark).obs;

  // Getter for current theme
  ThemeData get currentTheme => isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;

  // Method to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    update();  // Update UI after theme change
  }
}
