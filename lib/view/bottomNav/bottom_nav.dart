import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/color_resources.dart';
import 'bottom_nav_vm.dart';

class BottomNav extends StatelessWidget {
  static const String route = '/BottomNav';

  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavVm>(builder: (context, vm, _) {
      return Scaffold(
        extendBody: true,
        body: vm.pages[vm.selectedIndex],
        backgroundColor: Colors.white,
        // Set background to transparent
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (v) => vm.onItemTap(v),
          currentIndex: vm.selectedIndex,
          selectedItemColor: AppColors.Theme_blue,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "inactiveHome".toBottomNavPath,
              ),
              activeIcon: SvgPicture.asset("home".toBottomNavPath),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("inactiveSearch".toBottomNavPath),
              activeIcon: SvgPicture.asset("search".toBottomNavPath),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("inactiveValuation".toBottomNavPath),
              activeIcon: SvgPicture.asset("valuation".toBottomNavPath),
              label: 'Valuation',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("inactiveMore".toBottomNavPath),
              activeIcon: SvgPicture.asset("more".toBottomNavPath),
              label: 'More',
            ),
          ],
        ),
      );
    });
  }
}
