import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appButton.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonFunctions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:doodleblue_interview_by_pritesh/utils/intExtensions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget commonCacheNetworkImage({required String path, String? errorImage, double? height, double? width, BoxFit? fit, double? radius}) {
  return CachedNetworkImage(
    imageUrl: path,
    fit: fit ?? BoxFit.cover,
    height: height,
    width: width,
    placeholder: (context, url) => Center(child: Container(
      color: Colors.white,
      height: height,
      width: width,
    ).cornerRadiusWithClipRRect(radius ?? 5)),
    errorWidget: (context, url, error) {
      return Container(
        color: errorImage == null ? AppColors.dividerColor : Colors.transparent,
        height: height,
        width: width,
        alignment: Alignment.center,
        child: errorImage == null ? const Icon(Icons.image_not_supported_outlined, color: AppColors.greyIconColor, size: 25)
            : (errorImage.contains(".svg")
            ? SvgPicture.asset(errorImage, fit: BoxFit.cover, height: height, width: width)
            : Image.asset(errorImage, fit: BoxFit.cover, height: height, width: width)),
      ).cornerRadiusWithClipRRect(radius ?? 5);
    },
  ).cornerRadiusWithClipRRect(radius ?? 5);
}

/// Input Decoration
InputDecoration commonInputDecoration({String? hintText, Color? suffixIconColor, IconData? suffixIcon, Function()? suffixOnTap, Widget? dateTime, Widget? prefixIcon, Color? fillColor, bool? enableBorder = true, TextStyle? hintStyle}) {
  double borderRadius = commonTexFieldRadius;
  return InputDecoration(
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(14),
    filled: true,
    prefixIcon: prefixIcon,
    hintText: hintText ?? '',
    hintStyle: hintStyle ?? AppTextStyle.body.copyWith(color: AppColors.greyTextColor),
    fillColor: fillColor ?? AppColors.textFieldFillColor,
    counterText: '',
    suffixIcon: dateTime ?? (suffixIcon != null ? IconButton(onPressed: suffixOnTap, icon: Icon(suffixIcon, color: suffixIconColor ?? AppColors.greyIconColor, size: 20)) : null),
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.borderColor, width: 1), borderRadius: BorderRadius.circular(borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.primaryColor, width: 1), borderRadius: BorderRadius.circular(borderRadius)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: enableBorder == false ? Colors.transparent : Colors.red), borderRadius: BorderRadius.circular(borderRadius)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: enableBorder == false ? Colors.transparent : Colors.red), borderRadius: BorderRadius.circular(borderRadius)),
  );
}


BoxDecoration commonContainerDecoration({bool? shadow, Color? color, Color? shadowColor, BorderRadiusGeometry? borderRadius, Color? borderColor, double? borderWidth, double? blurRadius, Gradient? gradient}) {
  return BoxDecoration(
      color: color ?? Colors.white,
      gradient: gradient,
      borderRadius: borderRadius ?? BorderRadius.circular(commonRadius),
      border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0.0),
      boxShadow: shadow == true ? [BoxShadow(color: shadowColor ?? AppColors.shadowColor, blurRadius: blurRadius ?? 5.0)] : []);
}

/// Generic error widget
Widget genericErrorWidget({ErrorType? error, void Function()? onRefresh}) {
  log("Error Type : ${getErrorMsg(errorType: error ?? GenericError())}");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(getErrorMsg(errorType: error ?? GenericError()), textAlign: TextAlign.center, style: AppTextStyle.body2),
      20.height,
      if (onRefresh != null)
        AppButton(title: AppString.label.refresh, textStyle: AppTextStyle.button, onPressed: onRefresh)
    ],
  ).center().paddingSymmetric(vertical: 20, horizontal: 25);
}


/// Common divider
Widget commonDivider({double? height}) {
  return Divider(color: AppColors.dividerColor, height: height ?? 30);
}


/// App Loader
Widget appLoader() {
  return const CircularProgressIndicator(strokeCap: StrokeCap.round).paddingBottom(60).center();
}

