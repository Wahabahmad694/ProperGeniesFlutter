import 'package:ProperGenies/data/model/body/ForgotRequestBody.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/base_vm.dart';
import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';
import '../../../widgets/custom_snack.dart';
import '../verification/verification_code_view.dart';

class ForgotPasswordVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  onTapOTPSend(BuildContext context) {
    final data = {'email': emailController.text, 'isForgotPassword': true};
    Navigator.pushNamed(context, VerificationCodeView.route, arguments: data);
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  // Email validation using regular expression
  String? validateEmail(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      return "Email is required";
    } else if (!regex.hasMatch(email)) {
      return "Enter a valid Email";
    }
    return null;
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  forgotPassword(BuildContext context) async{
    _isLoading = true;
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with registration
      ApiResponse apiResponse = await mainRepo.forgotPassword(ForgotRequestBody(email: emailController.text));

      print("respomse ${apiResponse.response?.data}");
      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200 || apiResponse.response?.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        customSnack(context: context, text: "The forgot link has been sent in your given email, please check it.", isSuccess: true);

        print("user response from api  : ${apiResponse.response!.data}");

      }else{
        print("this is error ${apiResponse.error}");
        customSnack(context: context, text: apiResponse.error, isSuccess: false);
        _isLoading = false;
        notifyListeners();
      }
    }else{
      _isLoading = false;
      notifyListeners();
    }
  }
}
