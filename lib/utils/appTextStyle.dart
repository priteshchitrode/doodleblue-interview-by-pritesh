import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  AppTextStyle._();
  // H1
  static TextStyle h1 = GoogleFonts.montserrat(fontWeight:  FontWeight.w900, color: AppColors.primaryTextColor, fontSize: 35);
  static TextStyle h1BlackColor = h1.copyWith(color: Colors.black);
  // H2
  static TextStyle h2 = GoogleFonts.montserrat(fontWeight:  FontWeight.bold, color: AppColors.primaryTextColor, fontSize: 28);
  static TextStyle h2PrimaryColor = h2.copyWith(color: AppColors.primaryColor);
  // H3
  static TextStyle h3 = GoogleFonts.montserrat(fontWeight:  FontWeight.w700, color: AppColors.primaryTextColor, fontSize: 22);
  static TextStyle h3GreyColor = h3.copyWith(color: AppColors.greyTextColor);
  static TextStyle h3PrimaryColor = h3.copyWith(color: AppColors.primaryColor);
  // H3
  static TextStyle h4 = GoogleFonts.montserrat(fontWeight:  FontWeight.w600, color: AppColors.primaryTextColor, fontSize: 18);
  static TextStyle h4GreyColor = h4.copyWith(color: AppColors.greyTextColor);
  static TextStyle h4WhiteColor = h4.copyWith(color: Colors.white);
  // H3
  static TextStyle h5 = GoogleFonts.montserrat(fontWeight:  FontWeight.w600, color: AppColors.primaryTextColor, fontSize: 15);
  static TextStyle h5GreyColor = h5.copyWith(color: AppColors.greyTextColor);
  static TextStyle h5WhiteColor = h5.copyWith(color: Colors.white);
  static TextStyle h5PrimaryColor = h5.copyWith(color: AppColors.primaryColor);
  // H6
  static TextStyle h6 = GoogleFonts.montserrat(fontWeight:  FontWeight.w600, color: AppColors.primaryTextColor, fontSize: 12);
  static TextStyle h6GreyColor = h6.copyWith(color: AppColors.greyTextColor);
  static TextStyle h6WhiteColor = h6.copyWith(color: Colors.white);
  static TextStyle h6PrimaryColor = h6.copyWith(color: AppColors.primaryColor);

  /// --- Body ---
  static TextStyle body1 = GoogleFonts.montserrat(fontWeight:  FontWeight.w500, color: AppColors.primaryTextColor, fontSize: 18);
  static TextStyle body1GreyColor = body1.copyWith(color: AppColors.greyTextColor);
  static TextStyle body1BlackColor = body1.copyWith(color: Colors.black);
  static TextStyle body1WhiteColor = body1.copyWith(color: Colors.white);
  // Body 2
  static TextStyle body2 = GoogleFonts.montserrat(color: AppColors.primaryTextColor, fontSize: 16);
  static TextStyle body2GreyColor = body2.copyWith(color: AppColors.greyTextColor);
  static TextStyle body2BlackColor = body2.copyWith(color: Colors.black);
  static TextStyle body2WhiteColor = body2.copyWith(color: Colors.white);
  static TextStyle body2PrimaryColor = body2.copyWith(color: AppColors.primaryColor);
  // Body 3
  static TextStyle body3 = GoogleFonts.montserrat(color: AppColors.primaryTextColor, fontSize: 13);
  static TextStyle body3GreyColor = body3.copyWith(color: AppColors.greyTextColor);
  static TextStyle body3WhiteColor = body3.copyWith(color: Colors.white);
  // Body 3
  static TextStyle body4 = GoogleFonts.montserrat(color: AppColors.primaryTextColor, fontSize: 11);
  static TextStyle body4GreyColor = body4.copyWith(color: AppColors.greyTextColor);
  static TextStyle body4WhiteColor = body4.copyWith(color: Colors.white);
  // Body
  static TextStyle body = GoogleFonts.montserrat(color: AppColors.primaryTextColor, fontSize: 14);
  static TextStyle bodyGreyColor = body.copyWith(color: AppColors.greyTextColor);
  static TextStyle bodyWhiteColor = body.copyWith(color: Colors.white);

  /// --- Button ---
  // Primary
  static TextStyle button = GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16);
  static TextStyle buttonBlackTextColor = GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: AppColors.primaryTextColor, fontSize: 16);

  // Secondary
  static TextStyle secondaryButton = GoogleFonts.montserrat(fontWeight:  FontWeight.w600, color: AppColors.primaryTextColor, fontSize: 16);

  /// Appbar
  static TextStyle appBar = body1.copyWith(color: Colors.black);
}