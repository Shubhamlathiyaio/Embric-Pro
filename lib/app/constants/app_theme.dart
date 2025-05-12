import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.whiteColor,
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors.blackColor,
      onSurface: AppColors.blackColor,
    ),
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.blackColor, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.blackColor, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.blackColor, fontSize: 12),
      displayLarge: TextStyle(color: AppColors.blackColor, fontSize: 20),
      displayMedium: TextStyle(color: AppColors.blackColor, fontSize: 18),
      displaySmall: TextStyle(color: AppColors.blackColor, fontSize: 16),
      headlineLarge: TextStyle(color: AppColors.blackColor, fontSize: 22),
      headlineMedium: TextStyle(color: AppColors.blackColor, fontSize: 20),
      headlineSmall: TextStyle(color: AppColors.blackColor, fontSize: 18),
      titleLarge: TextStyle(color: AppColors.blackColor, fontSize: 24),
      titleMedium: TextStyle(color: AppColors.blackColor, fontSize: 22),
      titleSmall: TextStyle(color: AppColors.blackColor, fontSize: 20),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      surface: AppColors.blackColor,
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors.whiteColor,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white, fontSize: 12),
      displayLarge: TextStyle(color: Colors.white, fontSize: 20),
      displayMedium: TextStyle(color: Colors.white, fontSize: 18),
      displaySmall: TextStyle(color: Colors.white, fontSize: 16),
      headlineLarge: TextStyle(color: Colors.white, fontSize: 22),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 20),
      headlineSmall: TextStyle(color: Colors.white, fontSize: 18),
      titleLarge: TextStyle(color: Colors.white, fontSize: 24),
      titleMedium: TextStyle(color: Colors.white, fontSize: 22),
      titleSmall: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
