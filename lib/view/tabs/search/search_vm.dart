import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/body/SearchRequestBody.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/PropertyListingResponseBody.dart';
import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/main_repo.dart';

class SearchVm extends BaseVm {
  final MainRepo mainRepo = GetIt.I.get<MainRepo>();
  final ScrollController scrollController = ScrollController();

  PropertyListingResponseBody responseBody = PropertyListingResponseBody();
  SearchRequestBody? requestBody;

  int _currentPage = 1;
  bool _hasMoreData = true;
  bool _isLoading = false;

  bool _button1 = true;
  bool _button2 = false;

  bool get button1 => _button1;

  bool get button2 => _button2;

  final List<Properties> _properties = [];

  List<Properties> get properties => _properties;

  bool _tab = true;

  bool get tab => _tab;

  int get currentPage => _currentPage;

  set tab(bool value) {
    _tab = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  SearchVm() {
    init();
  }

  void setButton1() {
    _button1 = true;
    _button2 = false;
    notifyListeners();
  }

  void setButton2() {
    _button1 = false;
    _button2 = true;
    notifyListeners();
  }

  void init() async {
    await getPropertyListingBySearch(_currentPage, requestBody);
  }

  // Controllers
  final TextEditingController searchQueryController = TextEditingController();
  final TextEditingController propertyTypeController = TextEditingController();
  final TextEditingController departmentTypeController =
      TextEditingController();
  final TextEditingController cityTypeController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  void resetSearchState() {
    _properties.clear();
    _currentPage = 1;
    _hasMoreData = true;
    notifyListeners();
  }

  applySearch() async {
    try {
      // Create a new filters object dynamically, including only non-null fields
      Filters? filters = (propertyTypeController.text.isEmpty &&
              departmentTypeController.text.isEmpty &&
              cityTypeController.text.isEmpty &&
              maxPriceController.text.isEmpty &&
              minPriceController.text.isEmpty)
          ? null
          : Filters(
              type: propertyTypeController.text.isNotEmpty
                  ? propertyTypeController.text
                  : null,
              department: departmentTypeController.text.isNotEmpty
                  ? departmentTypeController.text
                  : null,
              city: cityTypeController.text.isNotEmpty
                  ? cityTypeController.text
                  : null,
              maxPrice: maxPriceController.text.isNotEmpty
                  ? double.tryParse(maxPriceController.text)
                  : null,
              // Safely parse max price
              minPrice: minPriceController.text.isNotEmpty
                  ? double.tryParse(minPriceController.text)
                  : null, // Safely parse min price
            );

      // Create the SearchRequestBody object dynamically
      SearchRequestBody? body =
          (searchQueryController.text.isEmpty && filters == null)
              ? null
              : SearchRequestBody(
                  filters: filters,
                  search: searchQueryController.text.isNotEmpty
                      ? searchQueryController.text
                      : null,
                );

      requestBody = body; // Set the dynamically created request body

      // Reset the page and perform the search
      _currentPage = 1;
      await getPropertyListingBySearch(_currentPage, requestBody);
    } catch (e) {
      print("Error in applySearch: $e");
    }
  }

  resetAllFilter() {
    propertyTypeController.text = "";
    departmentTypeController.text = "";
    cityTypeController.text = "";
    minPriceController.text = "";
    maxPriceController.text = "";
  }

  Future<void> getPropertyListingBySearch(
      int page, SearchRequestBody? body) async {
    if (_isLoading || (!_hasMoreData && page > 1)) return;

    _isLoading = true;
    notifyListeners();

    try {
      ApiResponse apiResponse =
          await mainRepo.getPropertyListingBySearch(page, body);

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
