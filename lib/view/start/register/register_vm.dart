import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/body/RegistrationRequestBody.dart';
import 'package:ProperGenies/data/model/response/RegistrationResponseBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';
import '../../../widgets/custom_snack.dart';
import '../verification/verification_code_view.dart';

class RegisterVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  String _selectedCountryCode = '+44'; // Default country code (e.g., Indonesia)
  String _phoneNumber = '';

  String get selectedCountryCode => _selectedCountryCode;

  String get phoneNumber => _phoneNumber;

  void updateCountryCode(String newCode) {
    _selectedCountryCode = "+${newCode}";
    notifyListeners(); // Notify the UI to rebuild
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners(); // Notify UI of the state change
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void updatePhoneNumber(String newNumber) {
    _phoneNumber = newNumber;
    notifyListeners(); // Notify the UI to rebuild
  }

  bool? characters = false;
  bool? upperLowercase = false;
  bool? numbersSpecialChar = false;

  final formKey = GlobalKey<FormState>();

  validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }

    // Combined regex patterns
    String lengthPattern = r'^.{8,}$'; // Minimum 8 characters
    String upperLowerCasePattern =
        r'^(?=.*[a-z])(?=.*[A-Z])'; // At least one uppercase and one lowercase letter
    String numberSpecialCharPattern = r'^(?=.*\d)(?=.*[@$!%*?&])';

    // Validating each condition
    if (!RegExp(lengthPattern).hasMatch(password)) {
      characters = false;
      notifyListeners();
    } else {
      characters = true;
      notifyListeners();
    }
    if (!RegExp(upperLowerCasePattern).hasMatch(password)) {
      upperLowercase = false;
      notifyListeners();
    } else {
      upperLowercase = true;
      notifyListeners();
    }
    if (!RegExp(numberSpecialCharPattern).hasMatch(password)) {
      numbersSpecialChar = false;
      notifyListeners();
    } else {
      numbersSpecialChar = true;
      notifyListeners();
    }
  }

  String? validPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  String? validName(String? name) {
    if (name == null || name.isEmpty) {
      return "Full Name is required";
    }
    return null;
  }

  String? validEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  onTapOTPSend(BuildContext context, String? id, String email) {
    final data = {
      'id': id,
      'email': email,
    };
    Navigator.pushNamed(context, VerificationCodeView.route, arguments: data);
  }

  RegistrationResponseBody responseBody = RegistrationResponseBody();

  registerUser(BuildContext cxt) async {
    _isLoading = true;
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      RegistrationRequestBody registrationBody = RegistrationRequestBody(
          email: emailController.text,
          password: passwordController.text,
          fullName: nameController.text,
          confirmPassword: passwordController.text,
          phoneNumber: "$_selectedCountryCode ${phoneController.text}");
      ApiResponse apiResponse = await mainRepo.registration(registrationBody);
      if (apiResponse.response != null &&
              apiResponse.response?.statusCode == 200 ||
          apiResponse.response?.statusCode == 201) {
        responseBody =
            RegistrationResponseBody.fromJson(apiResponse.response!.data);
        _isLoading = false;
        notifyListeners();
        onTapOTPSend(
            cxt, responseBody.user?.id ?? "", responseBody.user?.email ?? "");
      } else {
        print("this is error ${apiResponse.error}");
        customSnack(context: cxt, text: apiResponse.error, isSuccess: false);
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _isLoading = false;
    }
  }
}
