


import 'dart:convert';

import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/response/FavouritePropertyResponseBody.dart';
import 'package:ProperGenies/data/repo/main_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/model/response/base/api_response.dart';

class FavPropertyVm extends BaseVm{
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  FavoritePropertiesResponse responseBody = FavoritePropertiesResponse();

  FavPropertyVm() {
    init();
  }

  init() async {
    await getFavPropertyListing();
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getFavPropertyListing() async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await mainRepo.getFavPropertyList();

    print("respomse ${apiResponse.response?.data}");
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200 ||
        apiResponse.response?.statusCode == 201) {
      _isLoading = false;
      notifyListeners();
      responseBody =
          FavoritePropertiesResponse.fromJson(apiResponse.response!.data);
      print(jsonEncode(responseBody));
      notifyListeners();
    } else {
      print("this is error ${apiResponse.error}");
      _isLoading = false;
      notifyListeners();
    }
  }

}