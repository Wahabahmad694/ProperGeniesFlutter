import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import 'login_vm.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVm>(builder: (context, vm, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "propergenie".toSvgPath,
                    height: 222.h,
                    width: 142.w,
                  ),
                  const CustomText(
                    text: "Login to your account",
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: "Welcome back! Please enter your details",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: vm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomTextField(
                              controller: vm.emailController,
                              validatorFunction: vm.validateEmail,
                              showBorders: true,
                              borderColor: AppColors.Theme_blue,
                              hintText: "Email",
                              icon: const Icon(
                                Icons.email_rounded,
                                size: 20,
                              ),
                              backgroundColor: Colors.white),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextField(
                            controller: vm.passwordController,
                            validatorFunction: vm.validatePassword,
                            obscureText: vm.isPasswordVisible,
                            showBorders: true,
                            borderColor: AppColors.Theme_blue,
                            hintText: "Password",
                            icon: const Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            backgroundColor: Colors.white,
                            suffixWidget: GestureDetector(
                              onTap: () {
                                vm.isPasswordVisible = !vm.isPasswordVisible;
                              },
                              child: Icon(
                                vm.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                // Change icon based on visibility
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              vm.login(context);
                            },
                            child: CustomButton(
                              isLoading: vm.isLoading,
                              width: AppConstants.getScreenWidth(context),
                              text: 'Login',
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                vm.onTapForgot(context);
                              },
                              child: CustomText(
                                text: "Forgot Password?",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.Theme_blue,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                      onTap: () {
                        vm.onTapRegister(context);
                      },
                      child: CustomText(
                        text: "Register now",
                        color: AppColors.Theme_blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
