



import '../../../../../data/base_vm.dart';

class LettingsVm extends BaseVm{

  bool _isMovingForward = true;

  bool get isMovingForward => _isMovingForward;

  bool _isLetting = false;

  bool get isLetting => _isLetting;


  bool _isAdditionalService = false;

  bool get isAdditionalService => _isAdditionalService;

  bool _isDepositFees = false;

  bool get isDepositFees => _isDepositFees;


  void setMovingForward() {
    _isMovingForward = !_isMovingForward;
    notifyListeners();
  }
  void setDepositFees() {
    _isDepositFees = !_isDepositFees;
    notifyListeners();
  }

  void setLetting() {
    _isLetting = !_isLetting;
    notifyListeners();
  }
  void setAdditionalServices() {
    _isAdditionalService = !_isAdditionalService;
    notifyListeners();
  }
}