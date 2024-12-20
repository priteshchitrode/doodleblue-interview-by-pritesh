import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/addAndEditNoteScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/defaultScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/homeScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/noteListScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/splash/view/splashScreen.dart';
import 'package:doodleblue_interview_by_pritesh/routing/routeName.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appRoute.dart';
import 'package:flutter/material.dart';

class RouteController {
  RouteController._();
  static Route<dynamic> route(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashPage:
        return createRoute(const SplashScreen());
      case RouteName.home:
        return createRoute(const HomeScreen());
      case RouteName.addNote:
        final noteModel = arguments as NoteModel;
        return createRoute(AddAndEditNoteScreen(note: noteModel));
      default:
        return createRoute(const DefaultScreen());
    }
  }
}



