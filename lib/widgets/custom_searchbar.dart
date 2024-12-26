import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_resources.dart';
import 'custom_textfield.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar with rounded corners
        Container(
          decoration: BoxDecoration(
            color: AppColors.TEXTFIELD_COLOR, // Light background color
            borderRadius: BorderRadius.circular(14), // Rounded corners
          ),
          child:  CustomTextField(
              icon: const Icon(
                Icons.search,
                size: 20,
              ),
              showBorders: false,
              hintText: "Search here..",
              borderRadius: 20,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              backgroundColor: AppColors.TEXTFIELD_COLOR),
        ),
      ],
    );
  }
}
