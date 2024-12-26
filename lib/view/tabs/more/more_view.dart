import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/tabs/more/about/about_view.dart';
import 'package:ProperGenies/view/tabs/more/services/services_view.dart';
import 'package:ProperGenies/view/tabs/more/tools/tools_view.dart';
import 'package:ProperGenies/view/tabs/more/webView/webView_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/color_resources.dart';
import '../../../widgets/custom_text.dart';
import 'more_vm.dart';

class MoreView extends StatelessWidget {
  static const String route = '/MoreView';

  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoreVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Custom Header
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.Theme_blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        50,
                      ),
                      bottomRight: Radius.circular(
                        50,
                      ),
                    )),
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 10, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 75.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.r),
                              color: AppColors.WHITE),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              radius: 50.0, // Radius of the circle
                              backgroundImage: AssetImage("genie"
                                  .toPNGPath), // Replace with your image path
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: vm.responseModel.user?.fullName ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                                SizedBox(
                                  width: AppConstants.getScreenWidth(context) /
                                      2.5,
                                  child: CustomText(
                                      text: vm.responseModel.user?.email ?? "",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ],
                            ))
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 35,
                      ),
                      onPressed: () {
                        vm.confirmationDeletion(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                // Adds padding only to the right of the icon
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.apartment_rounded,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'About Us',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, AboutView.route);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.calculate,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'Tools',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ToolsView.route);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.design_services,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'Services',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ServicesView.route);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.account_balance,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'About ProperGenies ',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        final modal = {
                          'url': "https://propergenies.co.uk/about-us/",
                          'title': "About ProperGenies "
                        };
                        Navigator.pushNamed(context, WebViewScreen.route,
                            arguments: modal);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.pending_actions_rounded,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'Complaint Procedure',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        final modal = {
                          'url':
                              "https://propergenies.co.uk/complaints-procedure/",
                          'title': "Complaint Procedure"
                        };
                        Navigator.pushNamed(context, WebViewScreen.route,
                            arguments: modal);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.security,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'Privacy Policy',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        final modal = {
                          'url': "https://propergenies.co.uk/privacy-policy/",
                          'title': "Privacy Policy"
                        };
                        Navigator.pushNamed(context, WebViewScreen.route,
                            arguments: modal);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.contact_page,
                        color: AppColors.Theme_blue,
                      ),
                      title: CustomText(
                        text: 'Terms & Conditions',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        final modal = {
                          'url':
                              "https://propergenies.co.uk/terms-and-conditions/",
                          'title': "Terms & Conditions"
                        };
                        Navigator.pushNamed(context, WebViewScreen.route,
                            arguments: modal);
                      },
                    ),
                    const Divider(
                        color: Color(0xffE1E1E1),
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 16),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: CustomText(
                        text: 'Logout',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.red,
                      ),
                      onTap: () {
                        vm.logout(context);
                      },
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
