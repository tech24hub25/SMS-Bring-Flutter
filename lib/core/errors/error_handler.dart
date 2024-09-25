import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Couldn\'t connect to the server. Please check your internet and try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            'Sending the request took too long. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            'The server is taking too long to respond. Please try again.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            'There\'s a problem with the server\'s security. Please try again or contact support.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('The request was canceled. Please try again.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Couldn\'t connect to the server. Please check your internet connection.');
      case DioExceptionType.unknown:
        if (dioException.error != null &&
            dioException.error is SocketException) {
          return ServerFailure(
              'No internet connection. Please check and try again.');
        }
        return ServerFailure('Something went wrong. Please try again later.');

      default:
        return ServerFailure('Something went wrong. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    try {
      if (statusCode == 400 || statusCode == 401) {
        return ServerFailure(response['error']['message'] ??
            'There was a problem with your request. Please check your details and try again.');
      } else if (statusCode == 403) {
        return ServerFailure('You are not allowed to access this.');
      } else if (statusCode == 404) {
        return ServerFailure(
            'Couldn\'t find what you were looking for. Please try again.');
      } else if (statusCode == 409) {
        return ServerFailure(
            'There was a conflict with your request. Please check it and try again.');
      } else if (statusCode == 500) {
        return ServerFailure(
            'The server has an issue. Please try again later.');
      } else {
        return ServerFailure('Something went wrong. Please try again.');
      }
    } catch (e) {
      return ServerFailure('Bad response format. Please contact support.');
    }
  }
}
