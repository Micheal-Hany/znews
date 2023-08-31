import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMasssage;
  Failure(
    this.errorMasssage,
  );
}

class ServerFalure extends Failure {
  ServerFalure(super.errorMasssage);
  factory ServerFalure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFalure('Connection timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFalure('Send timeout with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFalure('Receiver timeout with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFalure('Opps, There is an Error please try again');
      case DioExceptionType.badResponse:
        return ServerFalure.fromResponce(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFalure('Your request was cancels, please try');
      case DioExceptionType.connectionError:
        return ServerFalure('Check your Connention and try again');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFalure('No internet connection');
        }
        return ServerFalure('Unexpected error please try again again !');
      default:
        return ServerFalure('Opps, There is an Error please try again');
    }
  }
  factory ServerFalure.fromResponce(int stateCode, dynamic responce) {
    if (stateCode == 400 || stateCode == 401 || stateCode == 403) {
      return ServerFalure(responce['message']);
    } else if (stateCode == 404) {
      return ServerFalure('Your request not found, please try');
    } else if (stateCode == 500) {
      return ServerFalure('Internal Server Error please try again');
    } else {
      return ServerFalure('Opps, There is an Error please try again');
    }
  }
}
