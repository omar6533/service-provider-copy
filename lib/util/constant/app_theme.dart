import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBG,
    textTheme: TextTheme(
      headlineLarge: AppFonts.bold.copyWith(fontSize: 30),
      displayLarge: AppFonts.bold.copyWith(fontSize: 24),
      displayMedium: AppFonts.bold.copyWith(fontSize: 20),
      labelLarge: AppFonts.bold.copyWith(fontSize: 16),
      bodySmall: AppFonts.regular.copyWith(fontSize: 14),
      labelMedium: AppFonts.semiBold.copyWith(fontSize: 16),
      labelSmall: AppFonts.regular.copyWith(fontSize: 16),
      titleLarge: AppFonts.regular.copyWith(fontSize: 24),
      // titleMedium: AppFonts.regular.copyWith(fontSize: 20),
      titleMedium: AppFonts.semiBold.copyWith(fontSize: 20),
      titleSmall: AppFonts.regular.copyWith(fontSize: 16),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryColor,
    ),
  );
}
