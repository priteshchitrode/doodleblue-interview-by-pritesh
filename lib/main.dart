import 'package:doodleblue_interview_by_pritesh/di/locator.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteEvent.dart';
import 'package:doodleblue_interview_by_pritesh/routing/routeController.dart';
import 'package:doodleblue_interview_by_pritesh/routing/routeName.dart';
import 'package:doodleblue_interview_by_pritesh/service/hasInternetConnection.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appThemeStyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await initialization();
  runApp(const MyApp());
}

Future<void> initialization() async {
  await dotenv.load(fileName: kReleaseMode ? "./assets/env/.env.production" : "./assets/env/.env.dev");
  await HasInternetConnection().checkConnectivity();
  initLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(
          create: (_) => NoteBloc()..add(LoadNotes()),
        ),
        BlocProvider<MobileDevicesBloc>(
          create: (_) => MobileDevicesBloc(repository: locator.get())..add(LoadMobileDevices()),
        ),
      ],
      child: MaterialApp(
        title: 'Pritesh Interview',
        theme: AppThemeStyle.appTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) => RouteController.route(settings),
        initialRoute: RouteName.splashPage,
      ),
    );
  }
}


