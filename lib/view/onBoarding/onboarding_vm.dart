
import 'package:flutter/material.dart';

import '../../data/base_vm.dart';
import '../start/login/login.dart';

class OnBoardingVm extends BaseVm {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners(); // Notify UI to rebuild
  }

  void nextPage(BuildContext context) {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushNamed(context, LoginScreen.route);
    }
    notifyListeners(); // Notify UI of the change
  }


  String getPageTitle() {
    switch (currentIndex) {
      case 0:
        return "Your Trusted Real Estate";
      case 1:
        return "Selling Property? Let’s Catch Up";
      case 2:
        return "Explore Best Realty of Your Savings";
      default:
        return "Your Trusted Real Estate";
    }
  }
  String getDescription() {
    switch (currentIndex) {
      case 0:
        return "Welcome to Your Trusted Real Estate Partner – Where Your Dream Home Awaits!";
      case 1:
        return "Unlock the potential of your property with our trusted real estate expertise.";
      case 2:
        return "Discover the reality of savings with our premier realty services.";
      default:
        return "Welcome to Your Trusted Real Estate Partner – Where Your Dream Home Awaits!";
    }
  }
  String getImagePath() {
    switch (currentIndex) {
      case 0:
        return 'onboard1';
      case 1:
        return 'onboard2';
      case 2:
        return 'onboard3';
      default:
        return 'onboard1';
    }
  }

}
