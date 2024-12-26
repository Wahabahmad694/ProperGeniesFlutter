import 'package:ProperGenies/view/bottomNav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/base_vm.dart';
import '../../../data/repo/common_repo.dart';
import '../../../helpers/my_prefrences.dart';
import '../../../utils/shared_pref_keys.dart';
import '../../onBoarding/onboarding_view.dart';
import '../login/login.dart';

class SplashVm extends BaseVm {
  double turns = 0.0;
  final CommonRepo commonRepo = GetIt.I.get<CommonRepo>();

  SplashVm(BuildContext context) {
    goTo(context);
  }

  goTo(BuildContext cxt) async {
    commonRepo.updateToken();
    MySharedPref pref = MySharedPref();
    bool? isFirst = await pref.getBool(key: SharedPrefsKeys.SHOW_ONBOARDING);

    Future.delayed(const Duration(seconds: 4), () {
      if (isFirst == null || isFirst == true) {
        commonRepo.setOnboardingShow(false);
        Navigator.pushNamedAndRemoveUntil(
            cxt, OnboardingView.route, (route) => false);
      } else {
        if (commonRepo.getUserObject()?.token != null ) {
          Navigator.pushNamedAndRemoveUntil(
              cxt, BottomNav.route, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              cxt, LoginScreen.route, (route) => false);
        }
      }
    });
  }
}
