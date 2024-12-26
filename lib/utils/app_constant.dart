

import 'package:flutter/material.dart';


class AppConstants {

  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

}
