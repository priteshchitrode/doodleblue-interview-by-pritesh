import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelper {
  static DateTime now() {
    return DateTime.now();
  }

  static String getDateTimeFormat(DateTime date) {
    var formatter = DateFormat('dd/MM/yyyy - hh:mm a');
    return formatter.format(date);
  }

  static String getFormattedDate(DateTime date) {
    var formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(date);
  }

  static String convertToAmPm(String time, BuildContext context) {
    DateTime parsedTime = DateTime.parse('1970-01-01 $time:00');
    String formattedTime = TimeOfDay.fromDateTime(parsedTime).format(context);
    return formattedTime;
  }

}
