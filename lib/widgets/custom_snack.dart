import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:ProperGenies/utils/color_resources.dart';

import '../utils/app_constant.dart';

snackBarWithoutContext(String text, Color color){
  return GetSnackBar(
    margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
    duration: const Duration(milliseconds: 3000),
    messageText: Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Container(
        padding: const EdgeInsets.only(left: 15.0, top: 12.0,bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color:color,
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/svg/logo.svg",width: 25,height: 25,),
            const SizedBox(width: 20,),
            SizedBox(
              width: 250,
              child: Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
  );
}



ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnack({required BuildContext context, Color? color,required String text, required bool isSuccess}){
  return ScaffoldMessenger.of(context)
      .showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color:isSuccess?AppColors.THEME_BUTTON: Colors.red,
            gradient:isSuccess ? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.THEME_BUTTON, AppColors.Theme_blue],
            ): null,
          ),
          child: Row(
            children: [
              SvgPicture.asset("assets/svg/propergenie.svg",width: 25,height: 25,),
              const SizedBox(width: 20,),
              SizedBox(
                width: AppConstants.getScreenWidth(context)/1.8,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
}