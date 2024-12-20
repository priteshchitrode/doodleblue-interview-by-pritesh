import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonFunctions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonWidgets.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:doodleblue_interview_by_pritesh/utils/intExtensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color? inputTextColor;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign = TextAlign.start;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? showCursor;
  final Function()? onTap;
  final int? maxLines;
  final bool? obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  const AppTextField(
      {super.key,
      this.controller,
      this.decoration,
      this.onTap,
      this.labelText,
      this.inputTextColor,
      this.cursorColor,
      this.inputFormatters,
      this.validator,
      this.onFieldSubmitted,
      this.currentFocus,
      this.nextFocus,
      this.keyboardType,
      this.readOnly,
      this.showCursor,
      this.maxLines,
      this.obscureText,
      this.maxLength,
      this.textInputAction,
      this.hintText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (labelText != null) Text(" $labelText", style: AppTextStyle.body2),
        if (labelText != null) 5.height,
        TextFormField(
          validator: validator,
          inputFormatters: inputFormatters ?? [],
          textAlign: textAlign,
          controller: controller,
          focusNode: currentFocus,
          cursorColor: cursorColor ?? AppColors.lightGreyTextColor,
          cursorWidth: 1.5,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          obscureText: obscureText ?? false,
          obscuringCharacter: "•",
          cursorRadius: const Radius.circular(5),
          readOnly: readOnly ?? false,
          showCursor: showCursor,
          style: TextStyle(color: inputTextColor ?? AppColors.primaryTextColor),
          decoration: decoration?.copyWith(hintText: hintText) ?? commonInputDecoration(hintText: hintText, fillColor: Colors.white),
          maxLength: maxLength,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted ??
              (value) {
                try {
                  fieldFocusChange(context, current: currentFocus!, nextFocus: nextFocus!);
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
          onTap: onTap ?? () {},
        ),
      ],
    );
  }
}
