import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_constant.dart';
import 'glass_effect.dart';

class BackGroundWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  const BackGroundWidget({
    required this.child,
    super.key, required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/svg/background.svg',
              width: AppConstants.getScreenWidth(context),
            )),
        FrostedGlassBox(
            theWidth: AppConstants.getScreenWidth(context),
            theHeight: AppConstants.getScreenHeight(context),
            theChild:  child,
            borderRadius: borderRadius)
      ],
    );
  }
}