import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/mobileDevicesModel.dart';

abstract class MobileDevicesState {}

class MobileDevicesInitial extends MobileDevicesState {}

class MobileDevicesLoading extends MobileDevicesState {}

class MobileDevicesLoaded extends MobileDevicesState {
  final List<MobileDevicesModel> devices;
  MobileDevicesLoaded(this.devices);
}

class MobileDevicesError extends MobileDevicesState {
  final ErrorType errorType;
  MobileDevicesError(this.errorType);
}
