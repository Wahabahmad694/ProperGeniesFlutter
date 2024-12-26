import 'dart:convert';

import 'package:ProperGenies/data/model/response/PropertyListingResponseBody.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/base_vm.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repo/main_repo.dart';

class HomeScreenVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  PropertyListingResponseBody responseBody = PropertyListingResponseBody();

  HomeScreenVm() {
    init();
  }

  init() async {
    await getPropertyListing();
    notifyListeners();
  }

  bool _tab = true;

  bool get tab => _tab;

  set tab(bool value) {
    _tab = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getPropertyListing() async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await mainRepo.getPropertyListing(1);

    print("respomse ${apiResponse.response?.data}");
    if (apiResponse.response != null &&
            apiResponse.response?.statusCode == 200 ||
        apiResponse.response?.statusCode == 201) {
      _isLoading = false;
      notifyListeners();
      responseBody =
          PropertyListingResponseBody.fromJson(apiResponse.response!.data);
      print(jsonEncode(responseBody));
      notifyListeners();
    } else {
      print("this is error ${apiResponse.error}");
      _isLoading = false;
      notifyListeners();
    }
  }
}
