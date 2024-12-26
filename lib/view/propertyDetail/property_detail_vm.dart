import 'dart:convert';
import 'dart:core';

import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/response/AddFavouritePropertyResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/response/PropertyDetailResponseBody.dart';
import '../../data/model/response/base/api_response.dart';
import '../../data/repo/main_repo.dart';
import '../../widgets/custom_item_svg.dart';
import '../../widgets/custom_snack.dart';
import '../../widgets/custom_text.dart';
import 'contactUs/contact_view.dart';

class PropertyDetailVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  PropertyDetailResponseBody responseBody = PropertyDetailResponseBody();
  AddFavouritePropertyResponse favResponseBody = AddFavouritePropertyResponse();

  String? id;

  PropertyDetailVm({required this.id}) {
    init();
  }

  init() async {
    await getPropertyDetail(id ?? "");
    notifyListeners();
  }

  bool _isExpanded = false; // Toggle state
  final int maxLines = 5;

  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded; // Toggle state
    notifyListeners(); // Notify UI to update
  }

  bool _isFav = false; //
  bool get isFav => _isFav;

   toggleFav(bool value) {
    _isFav = value; // Toggle state
    notifyListeners(); // Notify UI to update
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void launchDialer(String phoneNumber) async {
    final sanitizedNumber = phoneNumber.replaceAll(' ', '');

    final Uri url = Uri(scheme: 'tel', path: sanitizedNumber);
    await launchUrl(url);
  }

  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  LatLng _initialPosition = const LatLng(51.518261, -0.142000);

  // Getters
  LatLng get initialPosition => _initialPosition;

  Set<Marker> get markers => _markers;

  // Map Controller
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void _addInitialMarkers(String name) {
    _markers.addAll([
      Marker(
        markerId: MarkerId("1"),
        position: _initialPosition, // Example position
        infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    ]);
    notifyListeners();
  }

  // Add Marker
  void addMarker(LatLng position, String title) {
    final marker = Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: title),
    );
    _markers.add(marker);
    notifyListeners();
  }

  // Update Camera Position
  void moveCamera(LatLng position) {
    _mapController.animateCamera(CameraUpdate.newLatLng(position));
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
      double latitude =
          double.parse("${responseBody.property?.location?.latitude ?? 0.0}");
      double longitude =
          double.parse("${responseBody.property?.location?.longitude ?? 0.0}");

      toggleFav(responseBody.property?.isFavorite ?? false);
      notifyListeners();
      // Update _initialPosition with the new LatLng
      _initialPosition = LatLng(latitude, longitude);
      notifyListeners();
      _addInitialMarkers(responseBody.property?.location?.name ?? "");
      print(jsonEncode(responseBody));
      notifyListeners();
    } else {
      print("this is error ${apiResponse.error}");
      _isLoading = false;
      notifyListeners();
    }
  }

  contactCallSheet(ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: ctx,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return _contactUsSheet(context);
          },
        );
      },
    );
  }

  Widget _contactUsSheet(BuildContext context) {
    return SizedBox(
        height: 200.h,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              Container(
                width: 40, // Adjust the width as needed
                height: 4, // This gives it a thin appearance
                decoration: BoxDecoration(
                  color: const Color(0xff606060),
                  // Adjust the color
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomText(
                    text: "Please select option to contact ",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              InkWell(
                  onTap: () {
                    launchDialer("0207 9711 481");
                  },
                  child: const CustomMoreItem(icon: "call", text: "Call Us")),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ContactView.route,
                        arguments: id);
                  },
                  child: const CustomMoreItem(
                      icon: "paper", text: "Send Enquiry")),
            ],
          ),
        ));
  }

   markAsFavourite(BuildContext context)async {
     _isLoading = true;
     notifyListeners();
     ApiResponse apiResponse =
     await mainRepo.addFavProperty(propertyID: id ?? "");

     print("property detail ${apiResponse.response?.data}");
     if (apiResponse.response != null &&
         apiResponse.response?.statusCode == 200 ||
         apiResponse.response?.statusCode == 201) {
       _isLoading = false;
       notifyListeners();
       favResponseBody =
           AddFavouritePropertyResponse.fromJson(apiResponse.response!.data);
       customSnack(context: context, text: favResponseBody.message.toString(), isSuccess: true);

       toggleFav(favResponseBody.property?.isFavorite ?? false);
       notifyListeners();
       _addInitialMarkers(responseBody.property?.location?.name ?? "");
       print(jsonEncode(responseBody));
       notifyListeners();
     } else {
       print("this is error ${apiResponse.error}");
       _isLoading = false;
       notifyListeners();
     }
   }
}
