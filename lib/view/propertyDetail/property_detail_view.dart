import 'package:ProperGenies/helpers/date_formatter.dart';
import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/view/propertyDetail/property_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_text.dart';

class PropertyDetailView extends StatelessWidget {
  static const String route = '/PropertyDetailView';

  const PropertyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PropertyDetailVm>(builder: (context, vm, _) {
      return vm.isLoading
          ? Container(
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.Theme_blue,
                ),
              ),
            )
          : Scaffold(
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r), // Rounded top-left
                  topRight: Radius.circular(30.r), // Rounded top-right
                ),
                child: BottomAppBar(
                  color: AppColors.Theme_blue,
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Text Section
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: vm.responseBody.property?.department ?? "",
                              color: Colors.grey[200],
                              fontSize: 12.sp,
                            ),
                            CustomText(
                              text:
                                  '£ ${NumberFormat.decimalPattern("en_GB").format(vm.responseBody.property?.price ?? 0)} ${vm.responseBody.property?.priceUnit ?? ""}',
                              color: AppColors.THEME_BUTTON,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),

                        // Right Button Section
                        ElevatedButton.icon(
                          onPressed: () {
                            vm.contactCallSheet(context);
                          },
                          icon: const Icon(Icons.call,
                              color: AppColors.Theme_blue),
                          label: const Text(
                            'Contact Us ',
                            style: TextStyle(color: AppColors.Theme_blue),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 10.h), // Button size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    _topPhotoView(context, vm),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: "Address",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: const Color(0xff727272)),
                              Container(
                                height: 35.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360.r),
                                    color: AppColors.Theme_blue),
                                child: InkWell(
                                  onTap: () {
                                    vm.markAsFavourite(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 22,
                                      color: vm.isFav
                                          ? AppColors.THEME_BUTTON
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          CustomText(
                              text: vm.responseBody.property?.address ?? "",
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: AppColors.BUTTON_GRADIENT3),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    // Semi-transparent background
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color:
                                          AppColors.Theme_blue, // Border color
                                      width: 1.0, // Border width
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 5.w),
                                    const Icon(
                                      Icons.bed,
                                      size: 20,
                                      color: AppColors.Theme_blue,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      text:
                                          "x${vm.responseBody.property?.orientation?.beds}",
                                      color: AppColors.BUTTON_GRADIENT3,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    // Semi-transparent background
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color:
                                          AppColors.Theme_blue, // Border color
                                      width: 1.0, // Border width
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 5.w),
                                    SvgPicture.asset(
                                      "bathroom".toSvgPath,
                                      height: 18.h,
                                      width: 18.w,
                                      color: AppColors.Theme_blue,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      text:
                                          "x${vm.responseBody.property?.orientation?.bathrooms}",
                                      color: AppColors.BUTTON_GRADIENT3,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    // Semi-transparent background
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color:
                                          AppColors.Theme_blue, // Border color
                                      width: 1.0, // Border width
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 5.w),
                                    SvgPicture.asset(
                                      "reception".toSvgPath,
                                      height: 18.h,
                                      width: 18.w,
                                      color: AppColors.Theme_blue,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      text:
                                          "x${vm.responseBody.property?.receptions ?? 0}",
                                      color: AppColors.BUTTON_GRADIENT3,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          _propertyDescription(context,
                              vm.responseBody.property?.description ?? "", vm),
                          SizedBox(height: 5.h),
                          CustomText(
                            text: 'Rooms',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h),
                          _propertyImagesList(context, vm),

                          // property Detail //

                          SizedBox(height: 20.h),
                          CustomText(
                            text: 'Details',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),

                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Property Type:",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.Theme_blue,
                              ),
                              CustomText(
                                text: vm.responseBody.property?.type ?? "",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.black,
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Divider(
                                color: Color(0xffE1E1E1),
                                thickness: 0.5,
                              )),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Marketing Flag",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.Theme_blue,
                              ),
                              CustomText(
                                text:
                                    "${vm.responseBody.property?.marketingFlag ?? "not available"}",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.black,
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Divider(
                                color: Color(0xffE1E1E1),
                                thickness: 0.5,
                              )),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Furnished",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.Theme_blue,
                              ),
                              CustomText(
                                text: vm.responseBody.property?.furnishedFlag ==
                                        true
                                    ? "Furnished"
                                    : "Unfurnished",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.black,
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Divider(
                                color: Color(0xffE1E1E1),
                                thickness: 0.5,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Availability",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.Theme_blue,
                              ),
                              CustomText(
                                text: dateOnlyFormatter(
                                    vm.responseBody.property?.availability ??
                                        ""),
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.black,
                              )
                            ],
                          ),

                          // property location map //

                          SizedBox(height: 25.h),
                          CustomText(
                            text: 'Location',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 200.h, // Specify the height of the box
                            width: 350.w, // Specify the width of the box
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GoogleMap(
                                onMapCreated: vm.onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: vm.initialPosition,
                                  zoom: 11.0,
                                ),
                                markers: vm.markers,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomText(
                            text: 'Features',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          _propertyFeaturesList(context, vm),

                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'Floor Plan',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: 15.h),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        // Semi-transparent background
                                        border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1.0, // Border width
                                    )),
                                    child: Image.asset(
                                      'assets/images/epc.png',
                                      // Path to your overlay image
                                      width: 100.w,
                                      // Adjust the size of the overlay image
                                      height: 100.h,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'EPC',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: 15.h),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        // Semi-transparent background
                                        border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1.0, // Border width
                                    )),
                                    child: Image.asset(
                                      'assets/images/plan.png',
                                      // Path to your overlay image
                                      width: 100.w,
                                      // Adjust the size of the overlay image
                                      height: 100.h,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
    });
  }

  Widget _topPhotoView(BuildContext context, PropertyDetailVm vm) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            30.r,
          ),
          bottomRight: Radius.circular(
            30.r,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            30.r,
          ),
          bottomRight: Radius.circular(
            30.r,
          ),
        ),
        child: Stack(
          children: [
            // Background Image
            Image.network(
              vm.responseBody.property?.photos?[0].url ?? "",
              // Replace with your image URL
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Positioned(
              top: 35, // Adjust position
              left: 12, // Adjust position
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Handle back navigation
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black54, // Semi-transparent background
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.arrow_back, // Back arrow icon
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),

            Positioned(
                top: 35, // Adjust position
                right: 3, // Adjust position
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.Theme_blue,
                      // Semi-transparent background
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          30.r,
                        ),
                        bottomLeft: Radius.circular(
                          30.r,
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.account_balance_outlined, // Back arrow icon
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: vm.responseBody.property?.department ?? "",
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                )),
            // Overlay content
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 400.w,
                color: Colors.grey.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: vm.responseBody.property?.city ?? "",
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            text: truncateAfterLength(
                                vm.responseBody.property?.name ?? "", 50),
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _propertyDescription(
    BuildContext ctx,
    String text,
    PropertyDetailVm vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Description',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8.h),
        // Description Text
        Text(
          text,
          maxLines: vm.isExpanded ? null : vm.maxLines,
          overflow:
              vm.isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                vm.toggleExpanded();
              },
              child: Text(
                vm.isExpanded ? 'See less' : 'See more',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _propertyImagesList(
    BuildContext ctx,
    PropertyDetailVm vm,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 200.h, // Adjust height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Set ListView to horizontal
          itemCount: vm.responseBody.property?.photos?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 8.0),
              // Spacing between items
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Rounded corners
                child: Image.network(
                  vm.responseBody.property?.photos?[index].url ?? "",
                  width: 300,
                  // Adjust image width
                  height: 200,
                  fit: BoxFit.cover,
                  // Ensures the image covers the container
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.Theme_blue,
                      ), // Show loader while loading
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not available',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _propertyFeaturesList(
    BuildContext ctx,
    PropertyDetailVm vm,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: vm.responseBody.property?.propertyFeatures?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            height: 45.h,
            width: 353.w,
            // Green container's width
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColors.Theme_blue,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "tick".toSvgPath,
                  height: 22.h,
                  width: 22.w,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(
                  text:
                      vm.responseBody.property?.propertyFeatures?[index] ?? "",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.white,
                )
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 5.h,
        );
      },
    );
  }
}
