import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/body/RequestValuationBody.dart';
import 'package:ProperGenies/data/model/response/ValuationResponseBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';
import '../../animationScreen/animation_view.dart';

class ValuationVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  ValuationResponseBody valuationResponseBody = ValuationResponseBody();

  String _selectedCountryCode = '+44'; // Default country code (e.g., Indonesia)
  String _phoneNumber = '';

  String get selectedCountryCode => _selectedCountryCode;

  String get phoneNumber => _phoneNumber;

  void updateCountryCode(String newCode) {
    _selectedCountryCode = "${newCode}";
    notifyListeners(); // Notify the UI to rebuild
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController startNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController parkingController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController bedRoomsController = TextEditingController();
  TextEditingController receptionsController = TextEditingController();
  TextEditingController bathRoomsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController selectServiceTextController = TextEditingController();
  TextEditingController gardenController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();

  void updatePhoneNumber(String newNumber) {
    _phoneNumber = newNumber;
    notifyListeners(); // Notify the UI to rebuild
  }

  String? validateStartName(String? startName) {
    if (startName == null || startName.isEmpty) {
      return "Start Name is required";
    }
    return null;
  }

  String? validateBedRooms(String? rooms) {
    if (rooms == null || rooms.isEmpty) {
      return "BedRooms is required";
    }
    return null;
  }

  String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return "Address is required";
    }
    return null;
  }

  String? validateReception(String? reception) {
    if (reception == null || reception.isEmpty) {
      return "Reception is required";
    }
    return null;
  }

  String? validateDescription(String? text) {
    if (text == null || text.isEmpty) {
      return "Description is required";
    }
    return null;
  }

  String? validateBathRooms(String? bath) {
    if (bath == null || bath.isEmpty) {
      return "BathRooms is required";
    }
    return null;
  }

  String? validateSurName(String? surName) {
    if (surName == null || surName.isEmpty) {
      return "SurName is required";
    }
    return null;
  }

  String? validateArea(String? area) {
    if (area == null || area.isEmpty) {
      return "Area is required";
    }
    return null;
  }

  String? validateParking(String? park) {
    if (park == null || park.isEmpty) {
      return "Park is required";
    }
    return null;
  }

  String? validatePostalCode(String? code) {
    if (code == null || code.isEmpty) {
      return "Postal Code is required";
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

  String? validateServiceType(String? type) {
    if (type == null || type.isEmpty) {
      return "Please Chose your service type";
    }
    return null;
  }

  String? validatePropertyType(String? type) {
    if (type == null || type.isEmpty) {
      return "Please Chose your property type";
    }
    return null;
  }

  String? validateGarden(String? check) {
    if (check == null || check.isEmpty) {
      return "Please select you have garden?";
    }
    return null;
  }

  requestValuation(BuildContext cxt) async {
    if (formKey.currentState?.validate() ?? false) {
      bool gardenType = gardenController.text == "Yes" ? true : false;
      RequestValuationBody body = RequestValuationBody(
          email: emailController.text,
          address: addressController.text,
          area: areaController.text,
          department: selectServiceTextController.text,
          description: descriptionController.text,
          firstName: startNameController.text,
          hasGarden: gardenType,
          lastName: surNameController.text,
          orentation: Orentation(
            bathrooms: num.parse(bathRoomsController.text),
            beds: num.parse(bedRoomsController.text),
          ),
          parking: parkingController.text,
          phone: "$_selectedCountryCode${phoneController.text}",
          postalCode: postalCodeController.text,
          receptionRoom: num.parse(receptionsController.text),
          type: propertyTypeController.text);

      await getValuationData(body, cxt);
    } else {}
  }

  Future<void> getValuationData(
      RequestValuationBody model, BuildContext ctx) async {
    _isLoading = true;
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      ApiResponse apiResponse = await mainRepo.requestValuation(model);
      if (apiResponse.response != null) {
        if (apiResponse.response!.statusCode == 200 ||
            apiResponse.response!.statusCode == 201) {
          _isLoading = false;
          notifyListeners();
          valuationResponseBody =
              ValuationResponseBody.fromJson(apiResponse.response!.data);
          final modal = {
            'lottie': "animation1",
            'title': "Your request Has Been successfully submitted",
            'bypass': false
          };
          Navigator.pushNamed(ctx, AnimationView.route, arguments: modal);
        }
      } else {
        _isLoading = false;
        notifyListeners();
        print(apiResponse.error);
      }
    }
  }
}
