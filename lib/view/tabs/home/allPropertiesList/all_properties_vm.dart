import 'package:ProperGenies/data/model/response/PropertyListingResponseBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/base_vm.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repo/main_repo.dart';

class AllPropertiesVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  PropertyListingResponseBody responseBody = PropertyListingResponseBody();
  final ScrollController scrollController = ScrollController();

  int _currentPage = 1; // // Track loading state
  bool _hasMoreData = true; // Track if more data exists
  List<Properties> _properties = [];

  List<Properties> get properties => _properties;

  int get currentPage => _currentPage;

  AllPropertiesVm() {
    init();
  }

  init() async {
    await getPropertyListing(_currentPage);
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _tab = true;

  bool get tab => _tab;

  set tab(bool value) {
    _tab = value;
    notifyListeners();
  }

  Future<void> getPropertyListing(int page) async {
    if (_isLoading || (!_hasMoreData && page > 1)) return;

    _isLoading = true;
    notifyListeners();

    try {
      ApiResponse apiResponse = await mainRepo.getPropertyListing(page);

      if (apiResponse.response != null &&
          (apiResponse.response?.statusCode == 200 ||
              apiResponse.response?.statusCode == 201)) {
        responseBody =
            PropertyListingResponseBody.fromJson(apiResponse.response!.data);

        if (responseBody.listing?.properties != null &&
            responseBody.listing!.properties!.isNotEmpty) {
          if (page == 1) _properties.clear(); // Clear data for new searches
          _properties.addAll(responseBody.listing?.properties ?? []);
          if (responseBody.listing?.paginationInfo?.totalPages != null &&
              _currentPage <
                  responseBody.listing!.paginationInfo!.totalPages!) {
            _currentPage++;
          } else {
            _hasMoreData = false; // Set a flag to stop further requests
          }
          //
          notifyListeners(); // Increment page for next request
        } else {
          _properties.clear();
          _properties.addAll(responseBody.listing?.properties ?? []);
          _hasMoreData = false;
          notifyListeners();
        }
        notifyListeners();
      } else {
        print("API Error: ${apiResponse.error}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
