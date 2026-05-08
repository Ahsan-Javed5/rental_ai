import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      foregroundColor: AppColors.white,
      // titleTextStyle: TextStyle(
      //   color: AppColors.white,
      //   fontWeight: FontWeight.bold,
      // ),
    ),
    cardColor: Colors.white,
    useMaterial3: true,
  );
}
