import 'package:dio/dio.dart';
import 'package:doodleblue_interview_by_pritesh/data/network/apiService.dart';
import 'package:doodleblue_interview_by_pritesh/data/storage/securedSharedPreferences.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/repository/mobileDevicesRepository.dart';
import 'package:doodleblue_interview_by_pritesh/utils/customLog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';


var locator = GetIt.instance;

void initLocator() {
  CustomLog.info(locator, "Registering services with GetIt...");

  // Dio instance
  locator.registerLazySingleton(() => Dio());

  // Secure Storage
  locator.registerLazySingleton(() => const FlutterSecureStorage());
  locator.registerLazySingleton(() => SecuredSharedPreferences(locator<FlutterSecureStorage>()));

  // Service
  locator.registerLazySingleton(() => ApiService(locator<Dio>()));

  // Repository
  locator.registerLazySingleton(() => MobileDevicesRepository(locator<ApiService>()));

  // Bloc
  locator.registerLazySingleton(() => MobileDevicesBloc(repository: locator<MobileDevicesRepository>()));


  CustomLog.info(locator, "All instances registered.");
}