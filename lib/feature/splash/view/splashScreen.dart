import 'package:doodleblue_interview_by_pritesh/main.dart';
import 'package:doodleblue_interview_by_pritesh/routing/routeName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), (){
      initFunction();
    });
    super.initState();
  }

  Future<void> initFunction() async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(RouteName.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Icon(Icons.home_max, color: CupertinoColors.systemGrey4, size: 50)
      ),
    );
  }
}
