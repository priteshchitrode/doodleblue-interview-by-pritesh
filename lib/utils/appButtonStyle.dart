import 'package:doodleblue_interview_by_pritesh/main.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'constant/constantGlobalVariables.dart';

class AppButtonStyle {
  AppButtonStyle._();

  /// Primary
  static ButtonStyle primary = ElevatedButton.styleFrom(
    enableFeedback: true,
    elevation: 3.0,
    splashFactory: NoSplash.splashFactory,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.white,
    textStyle: AppTextStyle.button,
    fixedSize: Size(MediaQuery.of(navigatorKey.currentState!.context).size.width, commonButtonHeight),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(commonButtonRadius)),
  );

  static ButtonStyle disableButton = primary.copyWith(
    backgroundColor: WidgetStateProperty.all(AppColors.deActiveButtonColor),
    elevation: WidgetStateProperty.all(0),
  );

}
