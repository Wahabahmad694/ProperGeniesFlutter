import 'dart:convert';

import 'package:ProperGenies/data/model/response/LoginResponseBody.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_pref_keys.dart';
import '../datasource/remote/dio/dio_client.dart';

class CommonRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CommonRepo({required this.dioClient, required this.sharedPreferences});

  void setUserLoggedIn(LoginResponseBody userJson) {
    sharedPreferences.setBool(SharedPrefsKeys.IS_USER_LOGGED_IN, true);
    setUserObject(userJson);
  }

  void setUserLogout() {
    sharedPreferences.setBool(SharedPrefsKeys.IS_USER_LOGGED_IN, false);
    sharedPreferences.remove(SharedPrefsKeys.LOGGED_IN_USER_OBJECT);
    updateToken();
  }

  Future<void> setUserObject(LoginResponseBody userJson) async {
    await sharedPreferences.setString(SharedPrefsKeys.LOGGED_IN_USER_OBJECT,
        loginResponseBodyToJson(userJson));
    updateToken();
  }

  Future<void> setOnboardingShow(bool value) async {
    await sharedPreferences.setBool(SharedPrefsKeys.SHOW_ONBOARDING, value);
  }
  void updateToken() {
    dioClient.updateToken();
  }

  Future<void> getOnboardingSHow() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(SharedPrefsKeys
        .SHOW_ONBOARDING); // Returns null if the key doesn't exist
    print('Saved value: $value');
    updateToken();
  }

  LoginResponseBody? getUserObject() {
    if (sharedPreferences.containsKey(SharedPrefsKeys.LOGGED_IN_USER_OBJECT)) {
      return LoginResponseBody.fromJson(jsonDecode(
          sharedPreferences.getString(SharedPrefsKeys.LOGGED_IN_USER_OBJECT) ??
              ""));
    } else {
      return null;
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(SharedPrefsKeys.LOGGED_IN_USER_OBJECT);
    await sharedPreferences.remove(SharedPrefsKeys.TOKEN);
    await sharedPreferences.setBool(SharedPrefsKeys.SHOW_ONBOARDING, false);
    // FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    updateToken();
    return true;
  }
}
