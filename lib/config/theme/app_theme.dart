import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.darkGreen,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.darkGreen,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Montserrat",
      ),
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      displaySmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: "Poppins",
        wordSpacing: 1.5,
      ),
      displayLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        color: AppColors.darkGreen,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        wordSpacing: 1.5,
        fontFamily: "Inter",
      ),
      headlineLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkGreen,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Montserrat",
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        color: AppColors.darkGreen,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Montserrat",
      ),
      labelMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Inter",
      ),
      labelSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
    ),
  );
}
