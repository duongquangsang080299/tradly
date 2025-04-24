import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tradly_app/core/constant/constants.dart';

class Failure {
  const Failure({required this.message, this.code});
  final String message;
  final int? code;
}

class ErrorMappingHandler {
  static Failure apiErrorMappingHandler(Object error) {
    if (error is DioException) {
      final response = error.response;
      final statusCode = response?.statusCode;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return Failure(
            message: DioExceptionMessages.connectionTimeout,
            code: statusCode,
          );
        case DioExceptionType.sendTimeout:
          return Failure(
            message: DioExceptionMessages.sendTimeout,
            code: statusCode,
          );
        case DioExceptionType.receiveTimeout:
          return Failure(
            message: DioExceptionMessages.receiveTimeout,
            code: statusCode,
          );
        case DioExceptionType.badCertificate:
          return Failure(
            message: error.message ?? '',
            code: statusCode,
          );
        case DioExceptionType.badResponse:
          return Failure(
            message: error.message ?? '',
            code: statusCode,
          );
        case DioExceptionType.cancel:
          return Failure(
            message: DioExceptionMessages.cancel,
            code: statusCode,
          );
        case DioExceptionType.connectionError:
          return Failure(
            message: DioExceptionMessages.connectionError,
            code: statusCode,
          );
        case DioExceptionType.unknown:
          return Failure(
            message: error.message ?? '',
            code: statusCode,
          );
      }
    } else if (error is SocketException) {
      return const Failure(
        message: DioExceptionMessages.connectionError,
      );
    } else if (error is FormatException) {
      return Failure(message: error.message);
    } else {
      return const Failure(
        message: DioExceptionMessages.unexpectedErrorOccurred,
      );
    }
  }
}
