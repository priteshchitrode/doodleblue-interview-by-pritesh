import 'dart:ui';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route commonRoute(Widget screen){
  if(isAndroid){
    return MaterialPageRoute(builder: (context) => screen);
  }else{
    return CupertinoPageRoute(builder: (context) => screen);
  }
}

Route splashRoute(Widget screen){
  return MaterialPageRoute(builder: (context) => screen);
}



