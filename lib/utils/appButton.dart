import 'package:doodleblue_interview_by_pritesh/utils/appButtonStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonFunctions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  final bool? isLoading;
  final bool? isLinearGradient;
  const AppButton({super.key, this.textStyle, required this.title, required this.onPressed, this.isLoading = false, this.style, this.isLinearGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLinearGradient != null ? AppColors.buttonGradientColor : [AppColors.primaryColor, AppColors.primaryColor], // Replace with your gradient colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(commonButtonRadius),
      ),
      child: ElevatedButton(
        onPressed: isLoading == true ? (){} : (){
          commonHapticFeedback();
          onPressed?.call();
        },
        style: isLoading == true ? AppButtonStyle.disableButton :  (style ?? AppButtonStyle.primary),
        child: isLoading == true ? const CupertinoActivityIndicator() : Text(title, textAlign: TextAlign.center, style: textStyle ?? AppTextStyle.button),
      ),
    );
  }
}
