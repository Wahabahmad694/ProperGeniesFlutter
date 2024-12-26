import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color_resources.dart';
import '../../widgets/custom_text.dart';
import 'onboarding_vm.dart';

class OnboardingView extends StatelessWidget {
  static const String route = '/OnboardingView';

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingVm>(builder: (context, vm, _) {
      return Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        color: Colors.white,
        child: Column(
          children: [
            // Top section for the page indicator
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: SmoothPageIndicator(
                  controller: vm.pageController,
                  // Connected to the ViewModel's controller
                  count: 3,
                  // Number of pages
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Color(0xfff0fbff),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
            ),

            // Middle section for logo and sliding screens
            Expanded(
              child: PageView(
                controller: vm.pageController,
                onPageChanged: vm.onPageChanged,
                // Notify ViewModel when page changes
                children: [
                  buildPageContent(vm),
                  buildPageContent(vm),
                  buildPageContent(vm),
                ],
              ),
            ),

            // Bottom section for button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      vm.nextPage(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Next',
                          fontWeight: FontWeight.w700,
                          color: AppColors.Theme_blue,
                          fontSize: 18.sp,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          "arrow_right".toSvgPath,
                          height: 12.h,
                          width: 12.w,
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ));
    });
  }
}

Widget buildPageContent(OnBoardingVm vm) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            vm.getImagePath().toSvgPath,
            height: 306.h,
            width: 220.w,
          ), // The logo
          SizedBox(height: 20.h),
          Image.asset(
            'assets/images/logo.png', // Path to your overlay image
            width: 200.w, // Adjust the size of the overlay image
            height: 130.h,
          ),
          CustomText(
            text: vm.getPageTitle(),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),

          CustomText(
            text: vm.getDescription(),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ));
}
