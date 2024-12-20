import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesState.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/repository/mobileDevicesRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileDevicesBloc extends Bloc<MobileDevicesEvent, MobileDevicesState> {
  final MobileDevicesRepository repository;

  MobileDevicesBloc({required this.repository}) : super(MobileDevicesInitial()) {
    on<LoadMobileDevices>(_onLoadMobileDevices);
  }

  Future<void> _onLoadMobileDevices(LoadMobileDevices event, Emitter<MobileDevicesState> emit) async {
    emit(MobileDevicesLoading());
    Result result = await repository.fetchMobileDevices();
    if (result is Success) {
      emit(MobileDevicesLoaded(result.value));
    } else if (result is Error) {
      emit(MobileDevicesError(result.type));
    }
  }
}
