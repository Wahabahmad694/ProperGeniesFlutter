import 'package:ProperGenies/view/propertyDetail/contactUs/contact_vm.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../helpers/string_helpers.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class ContactView extends StatelessWidget {
  static const String route = '/ContactView';

  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactVm>(builder: (context, vm, _) {
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
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Form(
                  key: vm.formKey,
                  child: Column(
                    children: [
                      _topPhotoView(context, vm),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "You are Contacting to",
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomText(
                              text: "Proper Genies",
                              color: AppColors.Theme_blue,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              text: 'About',
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 10.h,
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
                              height: 10.h,
                            ),
                            Container(
                                height: 10, // Height of the line
                                width: double.infinity, // Full width
                                decoration: BoxDecoration(
                                  color: AppColors.Theme_blue, // Blue color
                                  borderRadius: BorderRadius.circular(
                                      5.r), // Curved borders
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text: "Full Name",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              borderColor: AppColors.Theme_blue,
                              controller: vm.fullNameController,
                              validatorFunction: vm.validateFullName,
                              borderRadius: 20.r,
                              showBorders: true,
                              hintText: "Enter your first name",
                              backgroundColor: AppColors.WHITE,
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text: "Email Address",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              controller: vm.emailController,
                              validatorFunction: vm.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              borderColor: AppColors.Theme_blue,
                              borderRadius: 20.r,
                              showBorders: true,
                              hintText: "Enter your valid email",
                              backgroundColor: AppColors.WHITE,
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text: "Phone Number",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                // Country Code Dropdown
                                InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      showPhoneCode:
                                          true, // Display country codes
                                      onSelect: (Country country) {
                                        vm.updateCountryCode(country
                                            .phoneCode); // Update ViewModel
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3688F4),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                          text: vm.selectedCountryCode,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),

                                // Phone Number Input Field
                                Expanded(
                                  child: CustomTextField(
                                      showBorders: true,
                                      controller: vm.phoneController,
                                      hintText: "XXX-XXXX-XXX",
                                      validatorFunction: vm.validatePhone,
                                      fontSize: 12.sp,
                                      keyboardType: TextInputType.phone,
                                      borderColor: AppColors.Theme_blue,
                                      fontWeight: FontWeight.w400,
                                      borderRadius: 20,
                                      backgroundColor: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text: "Message",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: "(optional)",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLines: 4,
                              borderColor: AppColors.Theme_blue,
                              keyboardType: TextInputType.text,
                              borderRadius: 10.r,
                              showBorders: true,
                              controller: vm.messageController,
                              hintText: "Type here...",
                              backgroundColor: AppColors.WHITE,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            InkWell(
                              onTap: () {
                                vm.sendEnquiry(context);
                              },
                              child: CustomButton(
                                isLoading: vm.isLoading,
                                width: AppConstants.getScreenWidth(context),
                                text: 'Send Enquiry',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
    });
  }

  Widget _topPhotoView(BuildContext context, ContactVm vm) {
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
}
