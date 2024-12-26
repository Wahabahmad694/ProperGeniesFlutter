import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_resources.dart';
import 'custom_text.dart';

Widget services(String iconPath, String label) {
  return Column(
    children: [
      Container(
        height: 75.h,
        width: 75.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360.r), color: AppColors.WHITE),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            radius: 50.0, // Radius of the circle
            backgroundImage:
                AssetImage(iconPath.toPngPath), // Replace with your image path
          ),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      CustomText(
        text: label,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      )
    ],
  );
}
