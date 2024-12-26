import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import 'forgot_password_vm.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String route = '/ForgotPasswordView';

  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordVm>(builder: (context, vm, _) {
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
        body: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: vm.formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "propergenie".toSvgPath,
                      height: 200.h,
                      width: 142.w,
                    ),
                    CustomText(
                      text: "Forgot Password",
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Please enter your email to reset your Password",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                          controller: vm.emailController,
                          showBorders: true,
                          borderColor: Colors.grey,
                          hintText: "Email",
                          validatorFunction: vm.validateEmail,
                          icon: const Icon(
                            Icons.email_rounded,
                            size: 20,
                          ),
                          backgroundColor: AppColors.WHITE),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                'forgotPassword'.toSvgPath,
                height: 240.h,
                width: 258.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    vm.forgotPassword(context);
                  },
                  child: CustomButton(
                    isLoading: vm.isLoading,
                    width: AppConstants.getScreenWidth(context),
                    text: 'Send Email',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
