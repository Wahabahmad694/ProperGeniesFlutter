import 'dart:convert';
import 'dart:io';

import 'package:ProperGenies/data/model/response/LoginResponseBody.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/shared_pref_keys.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor? loggingInterceptor;
  final SharedPreferences? sharedPreferences;

  late Dio dio;
  String? token;
  late String countryCode;

  DioClient(
    this.baseUrl,
    Dio dioC, {
    this.loggingInterceptor,
    this.sharedPreferences,
    this.token, // Add token and countryCode to constructor
    String? countryCode,
  }) {
    dio = dioC;
    this.countryCode =
        countryCode ?? 'US'; // Use 'US' as a fallback if not provided
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(milliseconds: 30000)
      ..options.receiveTimeout = const Duration(milliseconds: 30000)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        SharedPrefsKeys.LANG_KEY:
            this.countryCode == 'US' ? 'en' : this.countryCode.toLowerCase(),
      };
    dio.interceptors.add(loggingInterceptor!);
    manageCookieSession();
  }

  Future<void> manageCookieSession() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cookiePath', "$appDocPath/.cookies/");
  }

  void updateHeader(String? token, String? countryCode) {
    token = token ?? this.token;
    countryCode = countryCode == null
        ? this.countryCode == 'US'
            ? 'en'
            : this.countryCode.toLowerCase()
        : countryCode == 'US'
            ? 'en'
            : countryCode.toLowerCase();
    this.token = token;
    this.countryCode = countryCode;
    print('===Country code====>$countryCode');
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      SharedPrefsKeys.LANG_KEY:
          countryCode == 'US' ? 'en' : countryCode.toLowerCase(),
    };
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<MultipartFile> multipartFile(
    String uri,
    File file, {
    data,
  }) async {
    try {
      var response = await MultipartFile.fromFile(
        uri,
        filename: data,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  LoginResponseBody? getUserObject() {
    if (sharedPreferences!.containsKey(SharedPrefsKeys.LOGGED_IN_USER_OBJECT)) {
      return LoginResponseBody.fromJson(jsonDecode(
          sharedPreferences!.getString(SharedPrefsKeys.LOGGED_IN_USER_OBJECT) ??
              ""));
    } else {
      return null;
    }
  }

  void updateToken() {
    print("this is updating token ${getUserObject()?.token}");
    updateHeader(getUserObject()?.token, countryCode);
    // token = null;
  }
}
