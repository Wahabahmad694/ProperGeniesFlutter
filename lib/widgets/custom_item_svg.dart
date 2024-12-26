import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_text.dart';

class CustomMoreItem extends StatelessWidget {
  final String icon;
  final String text;

  const CustomMoreItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon.toSvgPath,
              height: 22.h,
              width: 17.w,
              color: AppColors.Theme_blue,
            ),
            const SizedBox(width: 16.0), // Space between icon and text
            Expanded(
              child: CustomText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.black, // Customize the text style
              ),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(
                color: Color(0xffE1E1E1),
                thickness: 0.5,))
      ],
    );
  }
}
