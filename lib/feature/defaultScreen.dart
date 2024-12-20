import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(AppString.error.errorSomethingWentWrong, style: AppTextStyle.h2).center(),
    );
  }
}
