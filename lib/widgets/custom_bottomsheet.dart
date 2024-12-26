import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_button.dart';
import 'custom_text.dart';

class CustomGenericBottomSheet extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  const CustomGenericBottomSheet({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 308.h,
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
              SvgPicture.asset(
                icon.toSvgPath,
                height: 58.h,
                width: 58.w,
                color: Colors.red,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: title,
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
                        text: description,
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
                        text: "Delete",
                        onTap: onTap,
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
