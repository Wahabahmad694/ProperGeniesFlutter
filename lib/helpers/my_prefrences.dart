import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  setString({required String key,required String value})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }
  setBool({required String key,required bool value})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }
  

  Future<bool?> getBool({required String key})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  Future<String?> getString({required String key})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
  Future<void> removeString({required String? key})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key!);
  }

// Function to save JSON data to SharedPreferences
  Future<void> saveJsonData({required String key, required String jsonData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonData);
  }
  Future<bool?> clearPreferences()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

// Function to retrieve JSON data from SharedPreferences
   getJsonData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString);
    }else{
      return null;
    }
  }

}