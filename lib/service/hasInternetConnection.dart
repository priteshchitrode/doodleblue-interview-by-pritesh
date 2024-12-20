import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doodleblue_interview_by_pritesh/utils/customLog.dart';

class HasInternetConnection {

  static bool isInternet = false;
  List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  final Connectivity connectivity = Connectivity();

  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult = (await (connectivity.checkConnectivity()));
    try {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        isInternet = true;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        isInternet = true;
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        isInternet = true;
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        isInternet = true;
      } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
        isInternet = true;
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        isInternet = false;
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        isInternet = false;
      }else{
        isInternet = false;
      }
      connectivitySubscription = connectivity.onConnectivityChanged.listen(_internetStream);
    } catch (e) {
      CustomLog.error(this, "Has Internet Connection error :", e);
    }
  }

  Future<void> _internetStream(List<ConnectivityResult> result) async {
    connectionStatus = result;
    checkConnectivity();
  }
}
