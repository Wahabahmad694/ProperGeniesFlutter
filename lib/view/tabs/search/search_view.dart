import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/tabs/search/search_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/PropertyListingResponseBody.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../propertyDetail/property_detail_view.dart';

class SearchView extends StatelessWidget {
  static const String route = '/SearchView';

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.Theme_blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    bottomRight: Radius.circular(
                      20,
                    ),
                  )),
              padding: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Search Your Desire Property",
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.white),
                      InkWell(
                        onTap: () {
                          openFilterSheet(context, vm);
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.r),
                              color: AppColors.WHITE),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.filter_alt,
                              size: 25,

                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: AppColors.TEXTFIELD_COLOR,
                          // Light background color
                          borderRadius:
                              BorderRadius.circular(14), // Rounded corners
                        ),
                        child: CustomTextField(
                            showBorders: false,
                            hintText: "Search here..",
                            borderRadius: 20,
                            controller: vm.searchQueryController,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            backgroundColor: AppColors.TEXTFIELD_COLOR),
                      ),
                      InkWell(
                        onTap: () async {
                          await vm.applySearch();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.r),
                              color: AppColors.WHITE),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.search,
                              size: 25,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !vm.isLoading) {
                      vm.getPropertyListingBySearch(
                          vm.currentPage, vm.requestBody);
                    }
                    return true;
                  },
                  child: vm.properties.isNotEmpty
                      ? ListView.separated(
                          controller: vm.scrollController,
                          itemCount:
                              vm.properties.length + (vm.isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == vm.properties.length) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final property = vm.properties[index];
                            return _propertyListItem(context,
                                property); // Replace with your card widget
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        )
                      : Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 90.h),
                                child: Image.asset(
                                  'assets/images/genie.PNG', // Foreground image
                                  width: 90.w, // Base size of the image
                                  height: 90.h,
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "No Property found",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _propertyListItem(BuildContext ctx, Properties property) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(ctx, PropertyDetailView.route,
            arguments: property.id);
      },
      child: Container(
        height: 112.h,
        width: 353.w,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust the radius
              child: Image.network(
                property.photos![0].url ?? "",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              // Use Expanded to fit the remaining space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        // Wrap inner columns with Expanded or Flexible
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  "£ ${NumberFormat.decimalPattern("en_GB").format(property.price ?? 0)}",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.Theme_blue,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "icMap".toSvgPath,
                                  height: 14.h,
                                  width: 14.w,
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  // Prevent overflow for long text
                                  child: CustomText(
                                    text: splitTextByLength(
                                        "${property.address}", 35),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    overflow: TextOverflow
                                        .ellipsis, // Add ellipsis if needed
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.bed,
                                          size: 14,
                                          color: AppColors.THEME_BUTTON),
                                      SizedBox(width: 5.w),
                                      CustomText(
                                        text: "x${property.orientation!.beds}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.hot_tub,
                                          size: 14,
                                          color: AppColors.THEME_BUTTON),
                                      SizedBox(width: 5.w),
                                      CustomText(
                                        text:
                                            "x${property.orientation!.bathrooms}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.category,
                                          size: 14,
                                          color: AppColors.Theme_blue),
                                      SizedBox(width: 5.w),
                                      CustomText(
                                        text: "${property.department}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.Theme_blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openFilterSheet(BuildContext cxt, SearchVm vm) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: cxt,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return _buildBottomSheetFilter(context, vm,);
          },
        );
      },
    );
  }

  Widget _buildBottomSheetFilter(BuildContext cxt, SearchVm vm) {
    return StatefulBuilder(builder: (cxt, setState){
      return SizedBox(
          height: 635.h,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(cxt);
                      },
                      child: Icon(
                        Icons.close,
                        size: 26,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    CustomText(
                      text: "Filters",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState((){
                          vm.resetAllFilter();
                        });
                      },
                      child: CustomText(
                        text: "reset",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      CustomText(
                        text: "Select your property service",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        height: 45.h,
                        width: 353.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState((){
                                    vm.setButton1();
                                    vm.departmentTypeController.text = "Sale";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: vm.button1 ? AppColors.Theme_blue: Colors.grey[200]),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: "Sales",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: vm.button1
                                            ? Colors.white
                                            : Colors.black,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState((){
                                    vm.setButton2();
                                    vm.departmentTypeController.text = "Lettings";
                                  });

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: vm.button2 ? AppColors.Theme_blue: Colors.grey[200]),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: "Lettings",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: vm.button2
                                            ? Colors.white
                                            : Colors.black,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: "Select your Property type",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 15.h),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Select your Property type ',
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.Theme_blue, width: 1.w),
                            // Default border color
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.Theme_blue, width: 1.w),
                            // Border color when focused
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: AppColors.WHITE,
                        ),
                        items: <String>[
                          "Bungalow",
                          "Detached Bungalow",
                          "Flat / Apartment",
                          "Apartment",
                          "Bedsit",
                          "Duplex",
                          "Ensuite Room",
                          "Flat",
                          "Mansionette",
                          "Room in Shared Flat",
                          "Pent House",
                          "Studio",
                          "Mews",
                          "House",
                          "Detached House",
                          "Semi Detached House",
                          "End of Terrace House",
                          "Mid-Terraced House",
                          "Terraced House",
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(
                              text: value,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          vm.propertyTypeController.text = newValue ?? "";
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: "Choose your Property's City",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        borderColor: AppColors.Theme_blue,
                        controller: vm.cityTypeController,
                        borderRadius: 20.r,
                        showBorders: true,
                        hintText: "Enter your City",
                        backgroundColor: AppColors.WHITE,
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // CustomText(
                      //   text: "Postal Code",
                      //   fontSize: 14.sp,
                      //   fontWeight: FontWeight.w600,
                      //   color: Colors.black,
                      // ),
                      // SizedBox(height: 10.h),
                      // CustomTextField(
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 12.sp,
                      //   borderColor: AppColors.Theme_blue,
                      //   borderRadius: 20.r,
                      //   showBorders: true,
                      //   hintText: "Enter your postal code",
                      //   backgroundColor: AppColors.WHITE,
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: "Enter Min Price",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        borderColor: AppColors.Theme_blue,
                        borderRadius: 20.r,
                        showBorders: true,
                        controller: vm.minPriceController,
                        keyboardType: TextInputType.number,
                        hintText: "£ Min",
                        backgroundColor: AppColors.WHITE,
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: "Enter Max Price",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        borderColor: AppColors.Theme_blue,
                        borderRadius: 20.r,
                        controller: vm.maxPriceController,
                        keyboardType: TextInputType.number,
                        showBorders: true,
                        hintText: "£ Max",
                        backgroundColor: AppColors.WHITE,
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButton(
                        text: "Apply",
                        buttonColor: AppColors.THEME_BUTTON,
                        onTap: () async {
                          Navigator.pop(cxt);
                          await vm.applySearch();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    }) ;
  }
}
