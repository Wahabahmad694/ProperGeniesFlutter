import 'package:ProperGenies/view/tabs/search/search_view.dart';
import 'package:ProperGenies/view/tabs/search/search_vm.dart';
import 'package:ProperGenies/view/tabs/valuation/valuation_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/base_vm.dart';
import '../tabs/home/homePage/homeVm.dart';
import '../tabs/home/homePage/home_screen.dart';
import '../tabs/more/more_view.dart';
import '../tabs/more/more_vm.dart';
import '../tabs/valuation/valuation_vm.dart';

class BottomNavVm extends BaseVm {
  int selectedIndex = 0;

  onItemTap(v) {
    selectedIndex = v;
    notifyListeners();
  }

  final List<Widget> _pages = [
    ChangeNotifierProvider(
        create: (context) => HomeScreenVm(), child: const HomeScreen()),
    ChangeNotifierProvider(
      create: (context) => SearchVm(),
      child: const SearchView(),
    ),
    ChangeNotifierProvider(
        create: (context) => ValuationVm(), child: const ValuationView()),
    ChangeNotifierProvider(
        create: (context) => MoreVm(), child: const MoreView())
  ];

  List<Widget> get pages => _pages;

  onAddButtonTap(BuildContext context) {}
}
