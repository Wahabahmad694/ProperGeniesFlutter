import 'package:ProperGenies/data/base_vm.dart';
import 'package:ProperGenies/data/model/response/LoginResponseBody.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/repo/common_repo.dart';
import '../../../data/repo/main_repo.dart';
import '../../../widgets/confirmation_bottomsheet.dart';
import '../../../widgets/custom_bottomsheet.dart';
import '../../animationScreen/animation_view.dart';

class MoreVm extends BaseVm {
  MainRepo mainRepo = GetIt.I.get<MainRepo>();
  final CommonRepo commonRepo = GetIt.I.get<CommonRepo>();
  LoginResponseBody responseModel = LoginResponseBody();

  MoreVm() {
    init();
  }

  init() {
    responseModel = commonRepo.getUserObject()!;
    notifyListeners();
  }

  logout(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmationBottomSheet();
          },
        );
      },
    );
  }

  confirmationDeletion(ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: ctx,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CustomGenericBottomSheet(
              icon: 'deleteAcc',
              title: 'Are You Sure?',
              description:
                  'if you delete you account, your personal data on ProperGenies will be delete',
              onTap: () async {
                deleteAccount(context);
              },
            );
          },
        );
      },
    );
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> deleteAccount(BuildContext ctx) async {
    _isLoading = true;
    notifyListeners();

    ApiResponse apiResponse =
        await mainRepo.deleteUser(userId: responseModel.user?.id ?? "");
    if (apiResponse.response != null) {
      if (apiResponse.response!.statusCode == 200 ||
          apiResponse.response!.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        final modal = {
          'lottie': "delete",
          'title':
              "Your Profile has been delete, you can register your account again. Thank You!",
          'bypass': false
        };
        Navigator.pushNamedAndRemoveUntil(
            ctx, AnimationView.route, arguments: modal, (rout) => false);
      }
    } else {
      _isLoading = false;
      notifyListeners();
      print(apiResponse.error);
    }
  }
}
