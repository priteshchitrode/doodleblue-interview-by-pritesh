@override
class AppString {
  AppString._();
  static AppLabelText label = AppLabelText();
  static AppErrorText error = AppErrorText();
  static ErrorTypeMsg errorType = ErrorTypeMsg();
  static SessionKey sessionKey = SessionKey();
}

class AppLabelText {
  final String refresh = "Refresh";
  final String pleaseWait = "Please Wait...";
  final String note = "Note";
  final String add = "Add";
  final String delete = "Delete";
  final String update = "Update";
  final String edit = "Edit";
  final String save = "Save";
  final String title = "Title";
  final String message = "Message";
  final String mobiles = "Mobiles";
  final String notes = "Notes";
  final String noteAddedSuccessfully = "Note added successfully";
  final String noteDeleteSuccessfully = "Note delete successfully";
  final String noteUpdateSuccessfully = "Note update successfully";

}

class AppErrorText {
  final String errorNoInternetConnection = "No internet connection";
  final String errorSomethingWentWrong = 'Something Went Wrong';
  final String errorThisFieldRequired = 'This field is required';
  final String errorInternetNotAvailable = 'Your internet is not working';
  final String errorDuringCommunication = 'Error During Communication';
  final String errorInvalidRequest = 'Invalid Request';
  final String errorUnauthorisedException = 'Unauthorised Exception';
  final String errorInvalidInputException = 'Invalid Input Exception';
  final String errorCommunicatingWithServer = 'Error occur while communicating with server, Try again later.';
  final String errorNoInput = 'No input, Input field is required.';
  final String failedToFetchData = 'Failed to fetch data';
  final String noDataFound = 'No data found, Please try again later.';
  final String failToFetchResponse = 'Failed to fetch response';
  final String deserializationError = 'Deserialization error';
  final String invalidPhoneNumber = 'Invalid phone number';
}

class ErrorTypeMsg {
  final String somethingWentWrong = "Sorry, Something went wrong.";
  final String responseStatusFail = "Response Status Fail";
  final String loginAttemptError = "Please connect your account manually";
  final String noInternetConnection = "No internet connection.";
  final String networkError = "Your internet not working,\n Please try again later.";
  final String notFound = "No record found, Please try again later.";
  final String genericError = "Something went wrong!!";
  final String timeOutError = "Oops Timeout!!";
  final String requestCancelledError = "Oops Timeout!!";
  final String conflictError = "Oops! It seems there's a conflict";
  final String deserializationError = "Oops! deserialization error,\n Something went wrong while loading the data.";
  final String serializationError = "Oops! serializationError,\n Something went wrong while loading the data.";
  final String invalidTokenError = "Authentication Failed, Invalid Token.";
  final String tokenExpireError = "Authentication Failed, Login Session Expired.";
  final String unauthenticatedError = "Authentication Required";
  final String badRequestError = "Bad Request: Something went wrong with your request";
  final String invalidInput = "Oops! Invalid Input,\n Please check your entry and try again.";
}

class SessionKey {

}
