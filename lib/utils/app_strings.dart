// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStrings{
  AppStrings._();
  //region Forgot pass
  static const String FORGOT_PASS = 'Forgot Password?';
  static const String FORGOT_PASS_ENTER = 'Enter your registered email to get the code';

  //endregion
  // region Signup
  static const String SURE = 'Make sure you meet the following criteria';
  static const List<String> CRITERIA = ['You must have Bicycle,Car or Scooter','Smart phone','Proof of address and government issue card','Your age must be 18+'];
  static const List<String> VEHICLES = ['Bicycle','Electric Bicycle','Scooter','Car'];

  //endregion

  // region verification
  static const String CODE = 'Please enter the verification code we just sent to your email/number';
  static const String VERIFY = 'Email Verification';
  static const String RESEND = 'If you didn\' have received the code?';

  //endregion

  // region earning
  static const String WEEKLY = 'Weekly Earnings';
  static const String TOTAL_ORDERS = 'Total Orders';
  static const String RECENT = 'Recent Earnings';

  //endregion
 static TextStyle styleFont16 = GoogleFonts.poppins(
     color: Colors.black,
     fontWeight: FontWeight.w500,
     fontSize: 16);
 static TextStyle styleFont14 = GoogleFonts.poppins(
     color: Colors.black,
     fontWeight: FontWeight.w500,
     fontSize: 14);
 static TextStyle styleFont18 = GoogleFonts.poppins(
     color: Colors.black,
     fontWeight: FontWeight.w700,
     fontSize: 18);
}