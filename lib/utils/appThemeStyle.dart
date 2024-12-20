import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:flutter/material.dart';

class AppThemeStyle {
  AppThemeStyle._();

  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.scaffoldBackgroundColor,
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    useMaterial3: true,
    appBarTheme:  const AppBarTheme(
        shadowColor: AppColors.shadowColor,
        backgroundColor: AppColors.appBarBackgroundColor,
        surfaceTintColor: Colors.white,
    ),
  );

}