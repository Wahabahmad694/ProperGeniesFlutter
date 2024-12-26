import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow; // Added this field for optional overflow handling

  const CustomText(
      {super.key,
        required this.text,
        this.fontSize,
        this.color,
        this.fontWeight,
        this.textAlign,
        this.textDecoration,
        this.decorationColor,
        this.maxLines,
        this.fontFamily,
        this.overflow = TextOverflow.ellipsis}); // Default to TextOverflow.ellipsis

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mulish(
        fontStyle: FontStyle.normal,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        decorationColor: decorationColor,
        decoration: textDecoration,
        color: color ?? Colors.black,
      ),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow, // Use the overflow property here
    );
  }
}
