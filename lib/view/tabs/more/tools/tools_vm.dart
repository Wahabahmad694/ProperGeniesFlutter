import 'package:ProperGenies/data/base_vm.dart';
import 'package:flutter/material.dart';

class ToolsVm extends BaseVm {
  bool _showResult = false;

  bool get showResult => _showResult;


  TextEditingController purchasedController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  TextEditingController annualRentController = TextEditingController();
  TextEditingController rentalYieldController = TextEditingController();

  void calculateYield() {
    if (formKey.currentState?.validate() ?? false) {
      _showResult = true;
      String monthlyRentText = monthlyRentController.text;
      double monthlyRent = double.tryParse(monthlyRentText) ?? 0.0;
      double yearlyRent = monthlyRent * 12;

      annualRentController.text = yearlyRent.toStringAsFixed(2);

      String annualRentText = annualRentController.text;
      String purchasedPriceText = purchasedController.text;

      double annualRent = double.tryParse(annualRentText) ?? 0.0;
      double purchasedPrice =
          double.tryParse(purchasedPriceText) ?? 1.0; // Avoid division by zero

      double yieldValue = annualRent / purchasedPrice;
      double yieldPercentage = yieldValue * 100;

      rentalYieldController.text =
          yieldPercentage.toStringAsFixed(2); // Format to 2 decimal places

      notifyListeners();
    }
  }


  /// validate function
  final formKey = GlobalKey<FormState>();

  String? validateRent(String? rent) {
    if (rent == null || rent.isEmpty) {
      return "Please enter your Monthly Rent";
    }
    return null;
  }

  String? validatePurchasedPrice(String? purchased) {
    if (purchased == null || purchased.isEmpty) {
      return "Please enter your Purchased price";
    }
    return null;
  }
}
