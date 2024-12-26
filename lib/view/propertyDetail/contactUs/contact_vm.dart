import 'dart:convert';

import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/body/ContactUsRequestBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/PropertyDetailResponseBody.dart';
import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';
import '../../animationScreen/animation_view.dart';

class ContactVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  PropertyDetailResponseBody responseBody = PropertyDetailResponseBody();

  String? id;

  ContactVm({required this.id}) {
    init();
  }

  init() async {
    await getPropertyDetail(id ?? "");
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isEnquiryLoading = false;

  bool get isEnquiryLoading => _isEnquiryLoading;

  set isEnquiryLoading(bool value) {
    _isEnquiryLoading = value;
    notifyListeners();
  }

  String _selectedCountryCode = '+44'; // Default country code (e.g., Indonesia)
  String _phoneNumber = '';

  String get selectedCountryCode => _selectedCountryCode;

  String get phoneNumber => _phoneNumber;

  void updateCountryCode(String newCode) {
    _selectedCountryCode = "${newCode}";
    notifyListeners(); // Notify the UI to rebuild
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? validateFullName(String? name) {
    if (name == null || name.isEmpty) {
      return "Full Name is required";
    }
    return null;
  }

  String? validatePhone(String? phone) {
    String pattern =
        r'^\+?[0-9]{7,15}$'; // Modify according to your phone number format
    RegExp regex = RegExp(pattern);
    if (phone == null || phone.isEmpty) {
      return "Phone number is required";
    } else if (!regex.hasMatch(phone)) {
      return "Enter a valid phone number";
    }
    return null;
  }

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

  getPropertyDetail(String propertyId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await mainRepo.getPropertyDetail(propertyID: propertyId);

    print("property detail ${apiResponse.response?.data}");
    if (apiResponse.response != null &&
            apiResponse.response?.statusCode == 200 ||
        apiResponse.response?.statusCode == 201) {
      _isLoading = false;
      notifyListeners();
      responseBody =
          PropertyDetailResponseBody.fromJson(apiResponse.response!.data);

      notifyListeners();
      print(jsonEncode(responseBody));
      notifyListeners();
    } else {
      print("this is error ${apiResponse.error}");
      _isLoading = false;
      notifyListeners();
    }
  }

  sendEnquiry(BuildContext cxt) async {
    _isEnquiryLoading = true;
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      ContactUsRequestBody body = ContactUsRequestBody(
          email: emailController.text,
          phoneNumber: "$_selectedCountryCode${phoneController.text}",
          message: messageController.text,
          name: fullNameController.text,
          property: id);
      await sendEnquiryRequest(body, cxt);
    }else{
      _isEnquiryLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendEnquiryRequest(
      ContactUsRequestBody model, BuildContext ctx) async {
      ApiResponse apiResponse = await mainRepo.contactUs(model);
      if (apiResponse.response != null) {
        if (apiResponse.response!.statusCode == 200 ||
            apiResponse.response!.statusCode == 201) {
          _isEnquiryLoading = false;
          notifyListeners();

          final modal = {
            'lottie': "enquiry_send",
            'title': "Your enquiry for viewing has Been successfully submitted",
            'bypass': true
          };
          Navigator.pushNamed(ctx, AnimationView.route, arguments: modal);
        }
      } else {
        _isEnquiryLoading = false;
        notifyListeners();
        print(apiResponse.error);
      }

  }
}
