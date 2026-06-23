import '../../user_managment/error_model.dart';
import '../constants/app_strings.dart';

enum IssueType {
  noInternetConnection,
  serverMaintenance,
  userNotSupported,
  userNotAuthorized,
}

/// ==========================================
/// Base Exception Class
/// ==========================================
class AppException implements Exception {
  final String? message;
  IssueType? issueType;

  AppException({
    required this.message,
    this.issueType,
  });

  @override
  String toString() {
    return '$message';
  }
}

/// ==========================================
/// Subclasses (Extending AppException)
/// ==========================================

class ConnectionIssueException extends AppException {
  final Map? response;

  ConnectionIssueException({this.response})
      : super(
    message: 'No Internet connection',
    issueType: IssueType.noInternetConnection,
  );

  List<Object?> get props => [message, response];
}

class AuthenticationFailedException extends AppException {
  final Map? response;

  AuthenticationFailedException({this.response})
      : super(
    message: response?["message"] ?? 'Authentication failed',
    issueType: IssueType.userNotAuthorized,
  );

  List<Object?> get props => [message, response];
}

class InvalidRequestException extends AppException {
  final Map? response;

  InvalidRequestException({this.response})
      : super(
    message: 'Invalid request, please check method, url, & parameters',
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class MalformedOutputException extends AppException {
  final Map? response;

  MalformedOutputException({this.response, String? customMessage})
      : super(
    message: customMessage,
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class ServerErrorException extends AppException {
  final Map? response;

  ServerErrorException({this.response})
      : super(
    message: response != null
        ? "${AppStrings.issueTypeEnumServerMaintenance} \n ${ErrorModel.fromResponse(response).responseMessage}"
        : null,
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class ServiceUnavailableException extends AppException {
  final Map? response;

  ServiceUnavailableException({this.response})
      : super(
    message: response != null
        ? ErrorModel.fromResponse(response).responseMessage
        : 'Service Unavailable',
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class NoDataFoundException extends AppException {
  final Map? response;

  NoDataFoundException({this.response})
      : super(
    message: AppStrings.noDataFound,
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class NotFoundException extends AppException {
  final Map? response;

  NotFoundException({this.response})
      : super(
    message: AppStrings.notFound,
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class UnknownErrorException extends AppException {
  final Map? response;

  UnknownErrorException({this.response})
      : super(
    message: response != null
        ? ErrorModel.fromResponse(response).responseMessage
        : 'Undefined Error',
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class FillAllFieldsException extends AppException {
  final Map? response;

  FillAllFieldsException({this.response})
      : super(
    message: 'Fill All Fields Exception',
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response];
}

class ErrorModelException extends AppException {
  final Map? response;
  final ErrorModel errorModel;

  ErrorModelException({required this.errorModel, this.response})
      : super(
    message: errorModel.responseMessage,
    issueType: IssueType.serverMaintenance,
  );

  List<Object?> get props => [message, response, errorModel];
}

class UserNotSupportedException extends AppException {
  final Map? response;

  UserNotSupportedException({this.response})
      : super(
    message: 'User Not supported',
    issueType: IssueType.userNotSupported,
  );

  List<Object?> get props => [message, response];
}

/// ==========================================
/// Exception Helper Handler
/// ==========================================
class CommonExceptionHandler {
  static String getErrorMessage(Exception error) {
    if (error is ErrorModelException) {
      return error.errorModel.responseMessage.isNotEmpty == true
          ? error.errorModel.responseMessage
          : AppStrings.internalServerError;
    }
    if (error is NoDataFoundException) {
      return AppStrings.noDataFound;
    }
    if (error is UserNotSupportedException) {
      return AppStrings.userNotSupportedMessage;
    } else if (error is ServerErrorException) {
      return AppStrings.internalServerError;
    } else if (error is ConnectionIssueException) {
      return AppStrings.noInternetConnectionMessage;
    } else if (error is NotFoundException) {
      return AppStrings.notFound;
    } else if (error is AppException) {
      return error.message ?? AppStrings.undefined;
    } else {
      return AppStrings.undefined;
    }
  }
}