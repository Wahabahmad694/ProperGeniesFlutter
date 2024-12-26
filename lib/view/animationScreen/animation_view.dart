import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/animationScreen/animation_vm.dart';
import 'package:ProperGenies/view/bottomNav/bottom_nav.dart';
import 'package:ProperGenies/view/start/login/login.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:ProperGenies/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/generic_animation.dart';

class AnimationView extends StatelessWidget {
  static const String route = '/AnimationView';

  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationVm>(builder: (context, vm, _) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
          child: CustomButton(
            text: vm.bypass ? "Go Back to Home" : "Done",
            width: 353.w,
            onTap: () {
              vm.bypass
                  ? Navigator.pushNamedAndRemoveUntil(
                      context, BottomNav.route, (route) => false)
                  : Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.route, (route) => false);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              LottieAnimationPlayer(
                lottiePath: vm.lottie.toAnimationPath,
                // Path to your Lottie JSON
                loop: true,
                // Loop the animation
                autoplay: true,
                height: 600.h,
                width: 400.w, // Autoplay on load
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                text: vm.title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
