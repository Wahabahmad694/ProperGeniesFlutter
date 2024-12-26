import 'package:ProperGenies/view/tabs/more/tools/tools_vm.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../utils/color_resources.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_textfield.dart';

class ToolsView extends StatelessWidget {
  static const String route = '/ToolsView';

  const ToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToolsVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            text: "Rental Yield Calculator",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Form(
              key: vm.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text:
                        "Are you looking to buy a property either now or in the near future? Then let us help you quickly and easily calculate the Rental Yield. Rental Yield is your client's annual rental income expressed as a percentage of their property value. This calculator can be used to compare yields from different properties to assist your client in determining which is the most suitable as a Buy to Let investment. simply enter the purchase price and monthly rent then the rental yield is calculated instantly.",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black,
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
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "Purchase Price",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      // Country Code Dropdown
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3688F4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: CustomText(
                              text: "£",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),

                      // Phone Number Input Field
                      Expanded(
                        child: CustomTextField(
                            showBorders: true,
                            validatorFunction: vm.validatePurchasedPrice,
                            controller: vm.purchasedController,
                            hintText: "Enter your purchased price",
                            fontSize: 12.sp,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            borderColor: Colors.grey,
                            fontWeight: FontWeight.w400,
                            backgroundColor: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "Monthly Rent",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      // Country Code Dropdown
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3688F4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: CustomText(
                              text: "£",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      // Phone Number Input Field
                      Expanded(
                        child: CustomTextField(
                            showBorders: true,
                            validatorFunction: vm.validateRent,
                            controller: vm.monthlyRentController,
                            hintText: "Enter your monthly rent",
                            fontSize: 12.sp,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            borderColor: Colors.grey,
                            fontWeight: FontWeight.w400,
                            backgroundColor: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    text: "Calculate",
                    leadingIcon: const Icon(
                      Icons.calculate,
                      color: Colors.white,
                    ),
                    onTap: () {
                      vm.calculateYield();
                    },
                  ),
                  if (vm.showResult)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        CustomText(
                          text: "Annual Rent",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            // Country Code Dropdown
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3688F4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CustomText(
                                    text: "£",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),

                            // Phone Number Input Field
                            Expanded(
                              child: CustomTextField(
                                  showBorders: true,
                                  controller: vm.annualRentController,
                                  fontSize: 12.sp,
                                  keyboardType: TextInputType.phone,
                                  borderColor: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  backgroundColor: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        CustomText(
                          text: "Rental Yield",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            // Country Code Dropdown
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3688F4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CustomText(
                                    text: "£",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            // Phone Number Input Field
                            Expanded(
                              child: CustomTextField(
                                  showBorders: true,
                                  controller: vm.rentalYieldController,
                                  fontSize: 12.sp,
                                  keyboardType: TextInputType.phone,
                                  borderColor: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  backgroundColor: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
