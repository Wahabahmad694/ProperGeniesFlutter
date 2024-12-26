import 'package:dio/dio.dart';
import 'error_response_body.dart';

class ApiErrorHandler {
  ApiErrorHandler._privateConstructor();

  static final ApiErrorHandler _instance = ApiErrorHandler._privateConstructor();

  factory ApiErrorHandler() => _instance;

  dynamic getMessage(dynamic error) {
    print("complete error: $error ");
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is FormatException) {
      return error.toString();
    }
    return "Unexpected error occurred";
  }


  static String _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request to API server was cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout with API server";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with API server";
      case DioExceptionType.sendTimeout:
        return "Send timeout with server";
      case DioExceptionType.unknown:
        return "Connection to API server failed due to internet connection";
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);
      case DioExceptionType.badCertificate:
        return "Invalid certificate received";
      case DioExceptionType.connectionError:
        return "Connection error occurred";
      default:
        return "Something went wrong try again";
    }
  }

  static dynamic _handleResponseError(Response? response) {
    if (response?.data != null) {
      try {
        print("Error body Data : ${response?.data} ");
        final errorResponse = ApiResponseError.fromJson(response!.data as Map<String, dynamic>);
        print("error response message : ${errorResponse.error?.messages[0]} ");
        if (errorResponse.error != null && errorResponse.error!.messages.isNotEmpty) {
          return errorResponse.error!.messages[0]; // Return the first error message
        }
      } catch (e) {
        print("Error while parsing response: $e");
        return response?.statusMessage ?? "An error occurred during the request";
      }
    }
    return response?.statusMessage ?? "An error occurred during the request";
  }
}
