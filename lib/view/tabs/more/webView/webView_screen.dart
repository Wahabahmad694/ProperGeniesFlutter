import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/view/tabs/more/webView/webView_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_web_veiw.dart';

class WebViewScreen extends StatelessWidget {
  static const String route = '/WebViewScreen';

  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewVm>(builder: (context, vm, _) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: vm.title,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: Colors.white,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.THEME_BUTTON,
          centerTitle: true,
        ),
        body: WebViewStack(
          url: vm.url, // Pass the URL dynamically
        ),
      );
    });
  }
}
