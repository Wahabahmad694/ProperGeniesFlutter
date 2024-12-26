import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ProperGenies/widgets/custom_text.dart';

import '../utils/app_constant.dart';
import '../utils/color_resources.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final String? iconPath;
  final Function()? onTap;
  final double? borderRadius;
  final bool? isLoading;
  final Widget? leadingIcon;

  const CustomButton(
      {super.key,
        required this.text,
        this.fontWeight,
        this.fontSize,
        this.textColor,
        this.height,
        this.width,
        this.iconPath,
        this.buttonColor,
        this.onTap,
        this.borderRadius,
        this.fontFamily,
        this.isLoading,
        this.borderColor,
        this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading != null && isLoading! == true ? () {} : onTap,
      child: Container(
        height: height ?? 44.h,
        width: width ?? AppConstants.getScreenWidth(context),
    decoration:   BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.Theme_blue, AppColors.Theme_blue],
          ),
        ),
        child: Center(
          child: isLoading != null && isLoading!
              ? CircularProgressIndicator(
            color: textColor ?? Colors.white,
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) SvgPicture.asset(iconPath!),
              if(leadingIcon != null) leadingIcon!,
              SizedBox(
                width: iconPath != null ? 10.w : 0,
              ),
              CustomText(text: text, color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}

