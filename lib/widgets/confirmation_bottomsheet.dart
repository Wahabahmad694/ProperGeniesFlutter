import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../data/repo/common_repo.dart';
import '../helpers/my_prefrences.dart';
import '../view/start/login/login.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final CommonRepo commonRepo = GetIt.I.get<CommonRepo>();

  // final Function()? onLogOut;

  //CustomConfirmationBottomSheet({ required this.onLogOut,super.key});
  @override
  Widget build(BuildContext context) {
    MySharedPref pref = MySharedPref();
    return SizedBox(
        height: 250.h,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              Container(
                width: 40, // Adjust the width as needed
                height: 4, // This gives it a thin appearance
                decoration: BoxDecoration(
                  color: const Color(0xff606060),
                  // Adjust the color
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              CustomText(
                text: "Confirmation Alert",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text:
                            "Are you sure you want to logout ? Make sure you have saved your recovery phrase",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff606060),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              SizedBox(height: 25.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomButton(width: 150.w, text: "Cancel")),
                      CustomButton(
                        width: 150.w,
                        text: "Logout",
                        onTap: () async {
                          commonRepo.clearSharedData();
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.route, (route) => false);
                        },
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
