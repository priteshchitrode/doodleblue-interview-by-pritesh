import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/data/response/status.dart';

class UIState<T>{
  Status? status;
  T? value;
  ErrorType? errorType;
  UIState(this.status, this.value, this.errorType);

  UIState.initial() :  status = Status.initial;
  UIState.loading() :  status = Status.loading;
  UIState.success(this.value) :  status = Status.success;
  UIState.error(this.errorType) :  status = Status.error;

  @override
  String toString(){
    return "Status : $status \n Message : $errorType \n Data : $value";
  }

}