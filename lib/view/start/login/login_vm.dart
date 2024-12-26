import 'package:ProperGenies/data/model/body/LoginRequestBody.dart';
import 'package:ProperGenies/data/model/response/LoginResponseBody.dart';
import 'package:ProperGenies/view/start/register/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/base_vm.dart';
import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/common_repo.dart';
import '../../../data/repo/main_repo.dart';
import '../../../widgets/custom_snack.dart';
import '../../bottomNav/bottom_nav.dart';
import '../forgotPassword/forgot_password_view.dart';

class LoginVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  final CommonRepo commonRepo = GetIt.I.get<CommonRepo>();


  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  onTapForgot(BuildContext context) {
    Navigator.pushNamed(context, ForgotPasswordView.route);
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Email validation using regular expression
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  // Password validation (At least 8 characters, uppercase, lowercase, number, and special character)
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  onTapRegister(BuildContext context) {
    Navigator.pushNamed(context, RegisterView.route);
  }

  LoginResponseBody loginResponseBody = LoginResponseBody();

  login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with registration
      ApiResponse apiResponse = await mainRepo.login(LoginRequestBody(
          email: emailController.text, password: passwordController.text));

      print("respomse ${apiResponse.response?.data}");
      if (apiResponse.response != null &&
              apiResponse.response?.statusCode == 200 ||
          apiResponse.response?.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        loginResponseBody =
            LoginResponseBody.fromJson(apiResponse.response!.data);
        commonRepo.setUserLoggedIn(
            LoginResponseBody.fromJson(apiResponse.response!.data));
        commonRepo.setUserObject(
            LoginResponseBody.fromJson(apiResponse.response!.data));
        Navigator.pushNamedAndRemoveUntil(
            context, BottomNav.route, (route) => false);

        print("user response from api  : ${apiResponse.response!.data}");
      } else {
        print("this is error ${apiResponse.error}");
        customSnack(
            context: context, text: apiResponse.error, isSuccess: false);
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }
}
