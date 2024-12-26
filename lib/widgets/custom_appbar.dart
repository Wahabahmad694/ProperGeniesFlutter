import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'glass_effect.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Set the background color of the app bar
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FrostedGlassBoxTwo(
                theChild: SvgPicture.asset("assets/svg/icons/qrScannerIcon.svg",height: 20,width: 20,), borderRadius: 20,
              ),
              FrostedGlassBoxTwo(
                theChild: SvgPicture.asset("assets/svg/icons/notificationIcon.svg",height: 25,width: 25,),
                borderRadius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
