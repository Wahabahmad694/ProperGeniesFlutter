import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/view/start/register/register_vm.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class RegisterView extends StatelessWidget {
  static const String route = '/RegisterView';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterVm>(builder: (context, vm, _) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "",
            fontWeight: FontWeight.w700,
            fontSize: 10.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: vm.formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              CustomText(
                                text: "Welcome to",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              )
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Proper',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Genies',
                                        style: TextStyle(
                                            color: AppColors.THEME_BUTTON, // Red asterisk
                                            fontSize: 35.sp,
                                            fontWeight:
                                            FontWeight.w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/genie.PNG', // Foreground image
                          width: 60.w, // Base size of the image
                          height: 60.h,
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        text: "Create an account with easy and fast methods",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      )
                    ]),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                        text: 'Full Name',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.black),
                    SizedBox(height: 10.h),
                    CustomTextField(
                        showBorders: true,
                        controller: vm.nameController,
                        hintText: "Enter Full Name",
                        fontSize: 12.sp,
                        validatorFunction: vm.validName,
                        borderColor: Colors.grey,
                        fontWeight: FontWeight.w400,
                        backgroundColor: Colors.white),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                        text: 'Phone Number',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.black),
                    SizedBox(height: 10.h),
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
                              borderRadius: BorderRadius.circular(10),
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
                              fontSize: 12.sp,
                              keyboardType: TextInputType.phone,
                              borderColor: Colors.grey,
                              fontWeight: FontWeight.w400,
                              backgroundColor: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                        text: 'Email',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.black),
                    SizedBox(height: 10.h),
                    CustomTextField(
                        controller: vm.emailController,
                        showBorders: true,
                        hintText: "Enter valid email",
                        fontSize: 12.sp,
                        validatorFunction: vm.validEmail,
                        borderColor: Colors.grey,
                        fontWeight: FontWeight.w400,
                        backgroundColor: Colors.white),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                        text: 'Password',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.black),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: vm.passwordController,
                      onChanged: (v) {
                        vm.validatePassword(v);
                      },
                      obscureText: vm.isPasswordVisible,
                      validatorFunction: vm.validPassword,
                      showBorders: true,
                      borderColor: Colors.grey,
                      hintText: "Password",
                      backgroundColor: Colors.white,
                      suffixWidget: GestureDetector(
                        onTap: () {
                          vm.isPasswordVisible = !vm.isPasswordVisible;
                        },
                        child: Icon(
                          vm.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons
                                  .visibility, // Change icon based on visibility
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "confirm".toSvgPath,
                          height: 12.h,
                          width: 12.w,
                          color: vm.characters!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: "Password Must Be At Least 8 Characters Long.",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: vm.characters!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "confirm".toSvgPath,
                          height: 12.h,
                          width: 12.w,
                          color: vm.upperLowercase!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: "Uppercase Letters & Lowercase Letters",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: vm.upperLowercase!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "confirm".toSvgPath,
                          height: 12.h,
                          width: 12.w,
                          color: vm.numbersSpecialChar!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: "Numbers, Non-alphanumeric Characters",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: vm.numbersSpecialChar!
                              ? const Color(0xFF00A738)
                              : Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            vm.toggleCheckbox(!vm.isChecked);
                          },
                          child: Container(
                            width: 22.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              color: vm.isChecked
                                  ? AppColors.THEME_BUTTON
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: vm.isChecked
                                ? const Icon(
                                    Icons.done, // Arrow icon when checked
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text:
                              "I agree with terms of Conditions and Privacy Policy",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        vm.registerUser(context);
                      },
                      child: CustomButton(
                        isLoading: vm.isLoading,
                        width: AppConstants.getScreenWidth(context),
                        text: 'Register Now',
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Already have an account? ",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CustomText(
                              text: "Login",
                              color: AppColors.Theme_blue,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );
    });
  }
}
