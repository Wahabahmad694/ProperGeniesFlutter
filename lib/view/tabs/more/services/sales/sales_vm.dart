import 'package:ProperGenies/data/base_vm.dart';

class SalesVm extends BaseVm {



  bool _isOurService = true;

  bool get ourService => _isOurService;

  bool _isAreaCovered = false;

  bool get isAreaCovered => _isAreaCovered;


  bool _isBenefits = false;

  bool get isBenefits => _isBenefits;

  bool _isFees = false;

  bool get isFees => _isFees;


  void setOurService() {
    _isOurService = !_isOurService;
    notifyListeners();
  }
  void setFees() {
    _isFees = !_isFees;
    notifyListeners();
  }

  void setAreaCovered() {
    _isAreaCovered = !_isAreaCovered;
    notifyListeners();
  }
  void setBenefits() {
    _isBenefits = !_isBenefits;
    notifyListeners();
  }
}
