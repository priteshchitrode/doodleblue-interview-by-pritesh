import 'package:doodleblue_interview_by_pritesh/data/network/apiService.dart';
import 'package:doodleblue_interview_by_pritesh/data/network/apiURL.dart';
import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/mobileDevicesModel.dart';
import 'package:doodleblue_interview_by_pritesh/utils/customLog.dart';

class MobileDevicesRepository {
  final ApiService _apiService;
  MobileDevicesRepository(this._apiService);

  Future<Result<List<MobileDevicesModel>>> fetchMobileDevices() async {
    try {
      Result result = await _apiService.get(ApiUrl.object);
      if (result is Success) {
        final List<dynamic> data = result.value;
        final devices = data.map((e) => MobileDevicesModel.fromJson(e)).toList();
        return Success(devices);
      } else if (result is Error) {
        return Error(result.type);
      } else {
        return Error(GenericError());
      }
    } catch (e, stackTrace) {
      CustomLog.error(this, 'Error fetching mobile devices:', e);
      CustomLog.error(this, 'stackTrace:', stackTrace);
      return Error(GenericError());
    }
  }

}
