import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/view/start/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_snack.dart';

class VerificationCodeVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();

  String? id;
  String? email;

  VerificationCodeVm({required this.id, required this.email}){
    init();
  }
  init(){}

  TextEditingController pinController = TextEditingController();
  bool _invalid = false;

  set invalid(bool value) {
    _invalid = value;
    notifyListeners();
  }


  bool get invalid => _invalid;

  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  verifyOtp(BuildContext ctx) async {
    _isLoading = true;
    notifyListeners();
    // if (formKey.currentState?.validate() ?? false) {
    ApiResponse apiResponse = await mainRepo.verifyOtp(id!, pinController.text);
    if (apiResponse.response != null &&
            apiResponse.response?.statusCode == 200 ||
        apiResponse.response?.statusCode == 201) {
      print("this is pin response ${apiResponse.response!.data}");
      snackBarWithoutContext(
          "Account has been created successfully, you can login now",
          AppColors.THEME_BUTTON);
      _isLoading = false;
      Navigator.pushNamedAndRemoveUntil(
          ctx, LoginScreen.route, (route) => false);
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      print("this is error ${apiResponse.error}");
      customSnack(context: ctx, text: apiResponse.error, isSuccess: false);
    }
    // }else{
    //   _isLoading = false;
    // }
  }
}
