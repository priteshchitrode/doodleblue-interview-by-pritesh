import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/stringExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void fieldFocusChange(BuildContext context, {required FocusNode current, required FocusNode nextFocus}) {
  current.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

Future<void> commonHapticFeedback() async {
  try {
    HapticFeedback.lightImpact();
    debugPrint("Haptic Touch Feedback");
  } catch (e) {
    debugPrint("Touch Feedback $e");
  }
}

Future<void> commonHideKeyboard(context) async {
  FocusScope.of(context).unfocus();
}

/// Format Time
formattedTime({required int timeInSecond}) {
  int sec = timeInSecond % 60;
  int min = (timeInSecond / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}


/// Get Error Msg
String getErrorMsg({required ErrorType errorType}) {
  switch (errorType) {
    case NotFoundError _:
      return AppString.errorType.notFound;
    case GenericError _:
      return AppString.errorType.genericError;
    case InternetNetworkError _:
      return AppString.errorType.networkError;
    case BadRequestError _:
      return AppString.errorType.badRequestError;
    case TokenExpiredError _:
      return AppString.errorType.tokenExpireError;
    case InvalidTokenError _:
      return AppString.errorType.invalidTokenError;
    case ConflictError _:
      return AppString.errorType.conflictError;
    case DeserializationError _:
      return AppString.errorType.deserializationError;
    case ResponseStatusFailed _:
      return AppString.errorType.responseStatusFail;
    case ErrorWithMessage  _:
      return errorType.message;
    default:
      return "(${errorType.toString()}) error".capitalize;
  }
}

bool isNumeric(String? s) {
  if(s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

