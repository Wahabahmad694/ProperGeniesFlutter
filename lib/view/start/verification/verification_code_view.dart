import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/start/verification/verification_code_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class VerificationCodeView extends StatelessWidget {
  static const String route = '/VerificationCodeView';

  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerificationCodeVm>(builder: (context, vm, _) {
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
          padding: EdgeInsets.only(top: 80.h, bottom: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "propergenie".toSvgPath,
                    height: 122.h,
                    width: 122.w,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Enter verification Code",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "We have sent a code to ${vm.email}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          length: 6,
                          obscureText: false,
                          enableActiveFill: true,
                          controller: vm.pinController,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.scale,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderWidth: 1,
                              borderRadius: BorderRadius.circular(10),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor: Colors.white,
                              inactiveFillColor: AppColors.THEME_BUTTON,
                              activeColor:
                                  vm.invalid ? Colors.red : Colors.white,
                              inactiveColor: vm.invalid
                                  ? Colors.red
                                  : AppColors.TEXTFIELD_COLOR,
                              selectedColor: Colors.white),
                          onCompleted: (v) {
                            // vm.goToIntroScreen(context);
                          },
                          onTap: () {
                            vm.invalid = false;
                          },
                          onChanged: (value) {},
                          appContext: context,
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        InkWell(
                          onTap: () {
                            vm.verifyOtp(context);
                          },
                          child: CustomButton(
                            isLoading: vm.isLoading,
                            width: AppConstants.getScreenWidth(context),
                            text: 'Verify Now',
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
