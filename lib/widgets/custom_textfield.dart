import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Icon? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  Function(String)? onChanged;

  CustomPasswordTextField(
      {super.key, this.onChanged,
        this.controller,
        this.hintText,
        this.labelText,
        this.keyboardType,
        this.prefixIcon});

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true; // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            obscureText: _obscureText,
            keyboardType: widget.keyboardType,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(

              suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: _toggle),

              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: widget.hintText ?? '',
              fillColor: Colors.grey,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "raleway",
                fontWeight: FontWeight.w600,
              ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "raleway",
                fontWeight: FontWeight.w600,
              ),

            ),
          ),
        ),);
  }
}






class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final dynamic icon;
  final bool? obscureText;
  final bool? isReadOnly;
  final Widget? suffixWidget;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? prefixPadding;
  final double? textPadding;
  final int? maxLines;
  final int? minLines;
  final TextAlign? textAlign;
  final bool showBorders;
  final Color? borderColor;
  final Function()? suffixFunction;
  final String? Function(String?)? validatorFunction;
  final FocusNode? focusNode;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.onTap,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.icon,
    this.obscureText,
    this.suffixWidget,
    this.borderRadius,
    this.backgroundColor,
    required this.showBorders,
    this.textAlign,
    this.borderColor,
    this.suffixFunction,
    this.validatorFunction,
    this.fontFamily,
    this.isReadOnly,
    this.prefixPadding,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
    this.focusNode, this.initialValue,
    this.textPadding
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      controller: widget.controller,
      onTap: widget.onTap,
      obscureText: widget.obscureText ?? false,
      readOnly: widget.isReadOnly ?? false,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      validator: widget.validatorFunction,
      inputFormatters: widget.inputFormatters ?? [],
      style: GoogleFonts.mulish(
        color: widget.color ?? Colors.black,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
            fontSize: widget.fontSize ?? 16.sp,
      ),

      decoration: InputDecoration(
        fillColor:widget.backgroundColor ?? Colors.transparent,
        filled: widget.backgroundColor == null ? false : true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.showBorders == true
                  ? widget.borderColor ?? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.showBorders == true
                  ? widget.borderColor ?? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.showBorders == true
                  ? widget.borderColor ?? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.showBorders == true
                  ? widget.borderColor ?? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
        ),
        prefixIcon: widget.icon != null
            ? Padding(
          padding: EdgeInsetsDirectional.only(
              start: widget.textPadding ?? 20.w, end: widget.prefixPadding ?? 12.0.w), // Adjust padding to give space
          child: widget.icon,
        )
            : null,
        prefixIconConstraints: BoxConstraints(
          minWidth: widget.textPadding ?? 23.w,
          minHeight: widget.textPadding ?? 16.h,
        ),
        suffixIcon: widget.suffixWidget != null ? GestureDetector(
          onTap: widget.suffixFunction,
          child: Padding(
            padding: EdgeInsets.only(right: 12.0.w),
            child: widget.suffixWidget,
          ),
        ) : null,
        suffixIconConstraints: BoxConstraints(
          minWidth: 23.w,
          minHeight: 16.h,
        ),
        alignLabelWithHint: false,
        contentPadding: EdgeInsets.only(bottom: 14.h,left: widget.icon == null ? widget.textPadding ?? 20.w : 0.w),
        border: InputBorder.none,
        hintText: widget.hintText ?? '',
        hintStyle: GoogleFonts.mulish(
          color: widget.color ?? Colors.black,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          fontSize: widget.fontSize ?? 16.sp,
        ),
      ),
    );
  }
}