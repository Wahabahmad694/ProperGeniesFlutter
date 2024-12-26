import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color_resources.dart';
import 'custom_text.dart';

Widget servicesSv(String iconPath) {
  return Column(
    children: [
      Container(
        height: 75.h,
        width: 75.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360.r), color: AppColors.WHITE),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:   SvgPicture.asset(iconPath.toSvgPath),
        ),
      ),
    ],
  );
}
