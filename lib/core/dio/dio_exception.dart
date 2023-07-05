import 'dart:developer';

import 'package:dio/dio.dart';

/// Dio Exception
class DioExceptions implements Exception {
  /// Dio Error
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        log(dioError.response!.data.toString());
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data as Map<String, dynamic>,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection Error';
        break;
    }
  }

  /// Error Message
  late String message;

  String _handleError(int? statusCode, Map<String, dynamic> error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return error['message'] as String;
      case 403:
        return error['message'] as String;
      case 404:
        return error['message'] as String;
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
