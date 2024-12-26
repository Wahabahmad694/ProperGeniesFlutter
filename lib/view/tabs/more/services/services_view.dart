import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/tabs/more/services/sales/sales_view.dart';
import 'package:ProperGenies/view/tabs/more/services/services_vm.dart';
import 'package:ProperGenies/view/tabs/valuation/valuation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/color_resources.dart';
import '../../../../widgets/custom_text.dart';

class ServicesView extends StatelessWidget {
  static const String route = '/ServicesView';

  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            text: "Service",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomText(
                        text:
                            'Discover your dream property with our real estate \napp! Browse, buy, sell, or rent homes effortlessly. \nAccess detailed listings, virtual tours, and connect \ndirectly with agents. \nSimplify your property journey with intuitive tools and \nreal-time updates.',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Container(
                      height: 10, // Height of the line
                      width: double.infinity, // Full width
                      decoration: BoxDecoration(
                        color: AppColors.Theme_blue, // Blue color
                        borderRadius:
                            BorderRadius.circular(5.r), // Curved borders
                      )),
                  SizedBox(height: 15.h),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, SalesView.route);
                        },
                          child: _buildToolCard('Sales', "sales")
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, SalesView.route);
                          },
                          child: _buildToolCard('Lettings', "letting")
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child:
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, ValuationView.route);
                          },
                            child: _buildToolCard('Request Valuation', "valuation", isWide: true)
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildToolCard(String title, String icon, {bool isWide = false}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Container(
        width: isWide ? 300 : 150, // Adjust width for wide or normal cards
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), 
          color: AppColors.Theme_blue.withOpacity(0.40)
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon.toSvgPath,
              height: 60.h,
              width: 60.h,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
