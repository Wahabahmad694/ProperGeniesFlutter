import 'package:ProperGenies/view/start/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/color_resources.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashVm>(builder: (context, vm, _) {
      return Scaffold(
        body: Container(
          width: AppConstants.getScreenWidth(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.BUTTON_GRADIENT1, AppColors.BUTTON_GRADIENT2],
            ),
          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Image.asset(
                'assets/images/logo.png', // Path to your overlay image
                width: 200.w, // Adjust the size of the overlay image
                height: 200.h,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CircularProgressIndicator(
                  color: AppColors.Theme_blue,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
