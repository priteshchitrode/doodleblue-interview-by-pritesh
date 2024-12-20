import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/stringExtensions.dart';
import 'package:flutter/material.dart';

abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Error<T> extends Result<T> {
  final ErrorType type;
  const Error(this.type);
}

abstract class ErrorType {
  String getText(BuildContext context);
}

class ErrorWithMessage extends ErrorType {
  final String? code;
  final String message;
  ErrorWithMessage({this.code, required this.message});

  @override
  String getText(BuildContext context) {
    if(code != null){
      return "Message: $message, Code: $code";
    }else{
      return "Message: $message";
    }
  }

  factory ErrorWithMessage.fromApiResponse(Map<String, dynamic> response) {
    return ErrorWithMessage(
      message: response['message'] ?? "",
    );
  }

}

class TokenExpiredError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.tokenExpireError.capitalize;
  }
}

class InvalidTokenError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.invalidTokenError.capitalize;
  }
}

class BadRequestError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.badRequestError.capitalize;
  }
}

class ConflictError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.conflictError.capitalize;
  }
}

class NotFoundError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.notFound.capitalize;
  }
}

class UnauthenticatedError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.unauthenticatedError.capitalize;
  }
}

class NetworkTimeoutError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.timeOutError.capitalize;
  }
}

class RequestCancelledError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.requestCancelledError.capitalize;
  }
}

class DeserializationError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.deserializationError.capitalize;
  }
}

class ResponseStatusFailed extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.responseStatusFail.capitalize;
  }
}

class SerializationError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.serializationError.capitalize;
  }
}

class GenericError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.genericError.capitalize;
  }
}

class LoginAttemptError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.loginAttemptError.capitalize;
  }
}

class InternetNetworkError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.networkError.capitalize;
  }
}


class InvalidInputError extends ErrorType {
  @override
  String getText(BuildContext context) {
    return AppString.errorType.invalidInput.capitalize;
  }
}

