import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/utils/app_constant.dart';
import 'package:ProperGenies/view/start/login/login.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:ProperGenies/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerifiedScreen extends StatelessWidget {
  String? text;

  VerifiedScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'blueLogo'.toSvgPath,
              height: 53.h,
              width: 51.w,
            ),
            Column(
              children: [
                SvgPicture.asset(
                  'blueTick'.toSvgPath,
                  height: 70.h,
                  width: 70.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomText(
                  text: text!,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route,
                      (Route<dynamic> route) => false);
                },
                child: CustomButton(
                    width: AppConstants.getScreenWidth(context),
                    text: "Login Now"))
          ],
        ),
      ),
    );
  }
}
