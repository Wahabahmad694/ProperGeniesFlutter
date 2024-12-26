import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/view/tabs/valuation/valuation_vm.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class ValuationView extends StatelessWidget {
  static const String route = '/ValuationView';

  const ValuationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ValuationVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            text: "Request Valuation",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 100),
              child: Form(
                key: vm.formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text:
                              "Are you looking to buy or rent a property either now \nor in the near future? Then let us know a bit about \nyou and what you are looking for, and we will keep \nin contact with you. Simply fill out the form below \nto register for property updates.",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                        height: 10, // Height of the line
                        width: double.infinity, // Full width
                        decoration: BoxDecoration(
                          color: AppColors.Theme_blue, // Blue color
                          borderRadius:
                              BorderRadius.circular(5.r), // Curved borders
                        )),
                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "First Name",
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
                      controller: vm.startNameController,
                      validatorFunction: vm.validateStartName,
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
                          text: "Surname Name",
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
                      controller: vm.surNameController,
                      validatorFunction: vm.validateSurName,
                      borderRadius: 20.r,
                      showBorders: true,
                      hintText: "Enter your surname name",
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
                              showPhoneCode: true, // Display country codes
                              onSelect: (Country country) {
                                vm.updateCountryCode(
                                    country.phoneCode); // Update ViewModel
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Address",
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
                      fontSize: 12.sp,
                      keyboardType: TextInputType.emailAddress,
                      borderColor: AppColors.Theme_blue,
                      borderRadius: 10.r,
                      controller: vm.addressController,
                      validatorFunction: vm.validateAddress,
                      maxLines: 3,
                      showBorders: true,
                      hintText: "Enter your property address",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Service Type",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select Service type',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
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
                        "Sale",
                        "Letting",
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
                        vm.selectServiceTextController.text = newValue ?? "";
                      },
                      validator: vm.validateServiceType,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Do you have any Garden?",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'if you have chose yes!',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
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
                        "Yes",
                        "No",
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
                        vm.gardenController.text = newValue ?? "";
                      },
                      validator: vm.validateGarden,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Property type",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                      validator: vm.validatePropertyType,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Area",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      controller: vm.areaController,
                      keyboardType: TextInputType.number,
                      validatorFunction: vm.validateArea,
                      borderRadius: 20.r,
                      showBorders: true,
                      hintText: "Enter your property area",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Parking",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      controller: vm.parkingController,
                      validatorFunction: vm.validateParking,
                      borderRadius: 20.r,
                      showBorders: true,
                      hintText: "Describe your property's parking",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Postal Code",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      borderRadius: 20.r,
                      controller: vm.postalCodeController,
                      validatorFunction: vm.validatePostalCode,
                      showBorders: true,
                      hintText: "Enter your Postal code",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "How many Bedrooms?",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      keyboardType: TextInputType.number,
                      borderRadius: 20.r,
                      showBorders: true,
                      controller: vm.bedRoomsController,
                      validatorFunction: vm.validateBedRooms,
                      hintText: "Enter your total bedrooms",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "How many Bathrooms?",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      keyboardType: TextInputType.number,
                      borderRadius: 20.r,
                      showBorders: true,
                      controller: vm.bathRoomsController,
                      validatorFunction: vm.validateBathRooms,
                      hintText: "Enter your total bathrooms",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "How many Reception?",
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
                      fontSize: 12.sp,
                      borderColor: AppColors.Theme_blue,
                      keyboardType: TextInputType.number,
                      borderRadius: 20.r,
                      showBorders: true,
                      controller: vm.receptionsController,
                      validatorFunction: vm.validateReception,
                      hintText: "Enter your total reception",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: "Describe about your Property",
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
                      fontSize: 12.sp,
                      maxLines: 4,
                      borderColor: AppColors.Theme_blue,
                      keyboardType: TextInputType.text,
                      borderRadius: 10.r,
                      showBorders: true,
                      controller: vm.descriptionController,
                      validatorFunction: vm.validateDescription,
                      hintText: "Type here...",
                      backgroundColor: AppColors.WHITE,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                        onTap: () {
                          vm.requestValuation(context);
                        },
                        child: CustomButton(
                          isLoading: vm.isLoading,
                          text: "Submit ",
                          width: 358.w,
                          borderRadius: 20.r,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
