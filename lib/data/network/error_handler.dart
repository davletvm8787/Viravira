import 'package:dio/dio.dart';

import '../../app/resource/string_manager.dart';
import 'failure.dart';

enum DataSource {
  successful,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  badCertificate,
  unknown,
  connectionError,
  default_;

  Failure getFailure() {
    switch (this) {
      case badRequest:
        return Failure(
          ResponseCode.badRequest,
          AppStrings.badRequestError,
        );
      case forbidden:
        return Failure(
          ResponseCode.forbidden,
          AppStrings.forbiddenError,
        );
      case unauthorised:
        return Failure(
          ResponseCode.unauthorised,
          AppStrings.unauthorizedError,
        );
      case DataSource.notFound:
        return Failure(
          ResponseCode.notFound,
          AppStrings.notFoundError,
        );
      case internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          AppStrings.internalServerError,
        );
      case connectTimeout:
        return Failure(
          ResponseCode.connectTimeout,
          AppStrings.timeoutError,
        );
      case cancel:
        return Failure(
          ResponseCode.cancel,
          AppStrings.defaultError,
        );
      case receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          AppStrings.timeoutError,
        );
      case sendTimeout:
        return Failure(
          ResponseCode.sendTimeout,
          AppStrings.timeoutError,
        );
      case cacheError:
        return Failure(
          ResponseCode.cacheError,
          AppStrings.cacheError,
        );
      case noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          AppStrings.noInternetError,
        );
      case default_:
        return Failure(
          ResponseCode.default_,
          AppStrings.defaultError,
        );
      case unknown:
        return Failure(
          ResponseCode.unknown,
          AppStrings.unknown,
        );
      case DataSource.successful:
        return Failure(
          ResponseCode.success,
          AppStrings.success,
        );
      case DataSource.noContent:
        return Failure(
          ResponseCode.noContent,
          AppStrings.noContent,
        );
      case DataSource.badCertificate:
        return Failure(
          ResponseCode.badCertificate,
          AppStrings.badCertificate,
        );
      case DataSource.connectionError:
        return Failure(
          ResponseCode.connectionError,
          AppStrings.connectionError,
        );
      default:
        return Failure(
          ResponseCode.default_,
          AppStrings.defaultError,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.default_.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.badResponse:
        {
          String? errorMessage = error.response?.data.toString();
          switch (error.response?.statusCode) {
            case ResponseCode.badRequest:
              {
                final failureModel = DataSource.badRequest.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }

            case ResponseCode.forbidden:
              {
                final failureModel = DataSource.forbidden.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }

            case ResponseCode.unauthorised:
              {
                final failureModel = DataSource.unauthorised.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }
            case ResponseCode.notFound:
              {
                final failureModel = DataSource.notFound.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }
            case ResponseCode.internalServerError:
              {
                final failureModel =
                    DataSource.internalServerError.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }
            default:
              {
                final failureModel = DataSource.default_.getFailure();
                failureModel.serverMessage = errorMessage;
                return failureModel;
              }
          }
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.badCertificate.getFailure();
      case DioErrorType.connectionError:
        return DataSource.connectionError.getFailure();
      case DioErrorType.unknown:
        return DataSource.unknown.getFailure();
    }
  }
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int default_ = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
  static const int unknown = -8;
  static const int badCertificate = -9;
  static const int connectionError = -10;
  static const int dataControlError = -11;
}
