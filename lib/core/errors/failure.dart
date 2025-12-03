import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  /// تحويل DioException لرسالة واضحة
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Invalid SSL certificate from the API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 0,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('The request to the API server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Failed to connect to the API server');
      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure(
          'An unknown error occurred while communicating with the API server',
        );
      default:
        return ServerFailure(
          'Oops, there was an error, please try again later',
        );
    }
  }

  /// التعامل مع response من الـ API بناءً على status code
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401) {
      return ServerFailure(
        response?['error']?['message'] ?? 'Bad request or Unauthorized request',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        'Your request was not found, please try again later',
      );
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, please try again later');
    } else {
      return ServerFailure('Oops, there was an error, please try again later');
    }
  }
}
