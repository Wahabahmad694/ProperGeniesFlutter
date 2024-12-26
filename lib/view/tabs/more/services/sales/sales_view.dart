import 'package:ProperGenies/view/tabs/more/services/sales/sales_vm.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/color_resources.dart';
import '../../../../../widgets/custom_text.dart';

class SalesView extends StatelessWidget {
  static const String route = '/SalesView';

  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            text: "Sales",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                CustomText(
                  text: "When you Decide To Sell",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: (){
                    vm.setOurService();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Why should you use our services",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if(vm.ourService)
                  Column(
                  children: [
                    _buildArea(
                        "Provide honest, well researched market appraisal \nfor your property with comparable evidence \nbased on location, current market condition, size, \nage."),
                    _buildArea(
                        "Provide you with our written terms and \nconditions of business."),
                    _buildArea(
                      "Offer competent professional advice and agree \nwith your input (if you so desire)on best \napproach to marketing the property."
                    ),
                    _buildArea(
                        "Take pictures and measurements of all available \naccommodation spaces, front and rear gardens \nareas, each with descriptive content."),
                    _buildArea(
                      "Offer simple practical, proven and effective \npresentation tips to create the right impression\nfor the potential buyer."
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                InkWell(
                  onTap: (){
                    vm.setAreaCovered();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "What areas do you cover",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if(vm.isAreaCovered)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "We cover many areas across West London including:",
                        color: Colors.black, // Red asterisk
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700 ),

                      _buildArea("Ealing"),
                      _buildArea("Acton"),
                      _buildArea("Brentford"),
                      _buildArea("Chiswick"),
                      _buildArea("Hounslow"),
                      _buildArea("Feltham"),
                      _buildArea("Isleworth"),

                    ],
                  ),

                InkWell(
                  onTap: (){
                    vm.setBenefits();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Benefits of doing business with us",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if(vm.isBenefits)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildArea("We target and update registered potential \nbuyers on our database with new property \nlistings matching their criteria via text messages, \nemails & phone calls."),
                      _buildArea("Free Advertising on Property Portals"),
                      _buildArea("We would display our “FOR SALE” ad-board to \ncreate awareness on passing traffic."),
                      _buildArea("We would chase up the selling process once a \nconfirmed offer is accepted to minimise \nunnecessary delays."),
                      _buildArea("We would update our clients with weekly \nprogress report as the case may be."),
                      _buildArea("Our job is complete only when contracts are \nsigned and exchanged."),
                      _buildArea("All staff are qualified and abide by our \nprofessional codes of ethics and practice and \nmake sure that we would not:"),
                        _buildLine("market your property without clear \nauthority."),
                        _buildLine("not give information that is irrelevant to \nthe selling process"),
                        _buildLine("not disclose private data without \nauthorised permission."),
                        _buildLine("not engage in any act that would be \ndetrimental to the sale process."),
                        _buildLine("not engage in any act that may be deemed \nirresponsible or unprofessional."),
                        _buildLine("not display a “FOR SALE” sign in front of \nan authorised sale when asked not to."),

                      _buildArea("And finally, you get overall commitment \nfrom our estate agency."),

                    ],
                  ),


                InkWell(
                  onTap: (){
                    vm.setFees();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Our Fees",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if(vm.isFees)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "We cover many areas across West London including:",
                          color: Colors.black, // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700 ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Sole Agency Fees:   ',
                              style: TextStyle(
                                  color: AppColors.Theme_blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '1.5% ',
                                  style: TextStyle(
                                      color: Colors.red, // Red asterisk
                                      fontSize: 16.sp,
                                      fontWeight:
                                      FontWeight.w600 // Same size as the text
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Multiple Agency Fees:   ',
                              style: TextStyle(
                                  color: AppColors.Theme_blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '2.0% ',
                                  style: TextStyle(
                                      color: Colors.red, // Red asterisk
                                      fontSize: 16.sp,
                                      fontWeight:
                                      FontWeight.w600 // Same size as the text
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),

                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildLine(String text) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  15.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "->",
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: AppColors.THEME_BUTTON,
              ),
              SizedBox(width: 10.w),
              CustomText(
                  text: text,
                  color: AppColors.Theme_blue, // Red asterisk
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500 ,
                textAlign: TextAlign.start,// Same size as the text
                  ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
  Widget _buildArea(String text) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: "•",
              fontWeight: FontWeight.w900,
              fontSize: 26.sp,
              color: AppColors.Theme_blue,
            ),
            SizedBox(width: 10.w),
            CustomText(
                text: text,
                color: Colors.black, // Red asterisk
                fontSize: 14.sp,
                fontWeight: FontWeight.w400 ,
              textAlign: TextAlign.start,// Same size as the text
                ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
