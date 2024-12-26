import 'package:ProperGenies/data/model/body/ContactUsRequestBody.dart';
import 'package:ProperGenies/data/model/body/ForgotRequestBody.dart';
import 'package:ProperGenies/data/model/body/LoginRequestBody.dart';
import 'package:ProperGenies/data/model/body/RegistrationRequestBody.dart';
import 'package:ProperGenies/data/model/body/RequestValuationBody.dart';
import 'package:ProperGenies/data/model/body/SearchRequestBody.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_end_points.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class MainRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  final errorHandler = ApiErrorHandler();

  MainRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(LoginRequestBody model) async {
    try {
      Response response =
          await dioClient.post(ApiEndPoints.login, data: model.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> forgotPassword(ForgotRequestBody body) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.forgotPassword,
          data: body.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> registration(RegistrationRequestBody model) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.register,
        data: model.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> verifyOtp(String id, String otp) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.OTPVerification,
        data: {
          "userId": id,
          "otp": otp,
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> getUser() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.getProfile,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> getPropertyDetail({required String propertyID}) async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.getPropertyDetail(id: propertyID),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> deleteUser({required String userId}) async {
    try {
      Response response = await dioClient.delete(
        ApiEndPoints.deleteUser(userId: userId),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> getPropertyListing(int pageNo) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.propertyListing,
          queryParameters: {"pageNo": pageNo, "chunkSize": 10});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> getPropertyListingBySearch(
      int pageNo, SearchRequestBody? search) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.propertyListing,
          data: search?.toJson(),
          queryParameters: {"pageNo": pageNo, "chunkSize": 10});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> getFavPropertyList() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.favListing,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> addFavProperty({required String propertyID}) async {
    try {
      Response response = await dioClient.put(
        ApiEndPoints.adPropertyFav(id: propertyID),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> requestValuation(RequestValuationBody request) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.requestValuation,
        data: request.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }

  Future<ApiResponse> contactUs(ContactUsRequestBody request) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.contactUs,
        data: request.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      var errorMessage = errorHandler.getMessage(e);
      return ApiResponse.withError(errorMessage);
    }
  }


}
