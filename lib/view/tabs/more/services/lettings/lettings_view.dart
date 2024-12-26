import 'package:ProperGenies/view/tabs/more/services/lettings/lettings_vm.dart';
import 'package:ProperGenies/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/color_resources.dart';
import '../../../../../widgets/custom_text.dart';

class LettingsView extends StatelessWidget {
  static const String route = '/LettingsView';

  const LettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LettingsVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            text: "Lettings",
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
                  text: "For Landlord Clients",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    vm.setMovingForward();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Here’s what we will do: Moving Forward",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (vm.isMovingForward)
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                              "Ask us to let your property and we’ll ask you to choose your service fee, we understand the rental market and therefore the subtle elements that sometimes gets neglected. We strongly believe every landlord client is to be treated as an individual whose asset investment must be protected.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text:
                              "As qualified professionals, all our clients are re-assured of our commitment to professionalism, attention to detail and reliability of service. In other words, we are passionate about our business and service standards.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text:
                              "Our estate agency have you covered for the following services:",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildArea("Lettings Only (Non-managed Long Let)"),
                        _buildArea("Lettings Only (Non-managed Short Let)"),
                        CustomText(
                          text:
                              "We want our Landlords to unburden themselves from the worry of finding the right tenant for their property as we are here to look after your interest.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text:
                              "Our clients expect nothing short of professional competence.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    vm.setLetting();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Letting Services",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if (vm.isLetting)
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                              "This is where we are instructed by the Landlord to find tenants, arrange viewings, perform tenant referencing and draw up tenancy agreement. Our duty ends as soon as contracts are signed by the moving in tenant, keys are signed for and funds are transferred into landlords account.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "OUR FEES",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildArea("Lettings Only (Non-managed Long Let) 7%"),
                        _buildArea("Lettings Only (Non-managed Short Let) 10%"),
                      ],
                    ),
                  ),
                InkWell(
                  onTap: () {
                    vm.setAdditionalServices();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Additional Services",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if (vm.isAdditionalService)
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                              "This is where Landlord can request for other services related to the property or tenant move in. On request of landlord we can arrange following services:",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildArea("Tenancy Agreement"),
                        _buildArea("Tenant Referencing"),
                        _buildArea("Professional Photography of Property"),
                        _buildArea("Professional Cleaning"),
                        _buildArea("Keys Cutting"),
                        _buildArea("Check In / Check Out Inventory"),
                        _buildArea("Arranging Gas Safety Certificate (GSC)"),
                        _buildArea(
                            "Arranging Electrical Installation Condition \nReport (EICR)"),
                        _buildArea("Arranging Portable Appliance Test (PAT)"),
                        _buildArea("Arranging Energy Performance Certificate"),
                      ],
                    ),
                  ),
                InkWell(
                  onTap: () {
                    vm.setDepositFees();
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    text: "Zero deposit rent scheme",
                    width: 370.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                if (vm.isDepositFees)
                  Container(
                    color: Colors.white,
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      children: [
                        CustomText(
                          text:"A Zero Deposit Guarantee is an alternative to a traditional tenancy deposit. It provides the same level of financial protection and security to landlords, whilst reducing the upfront costs to tenants. With Zero Deposit, tenants will still complete their referencing checks as per the usual process and will remain wholly responsible for any financial loss or damage covered by their Assured Shorthold Tenancy agreement.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "If a landlord offers the choice of a Zero Deposit, tenants can choose between Zero Deposit and the traditional cash deposit. Zero Deposit still offers cover up to the value of six weeks' rent whereas under the Tenant Fee Act 2015 most tenant deposits will be restricted to the value of five weeks' rent only.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "WHY DO LANDLORDS CHOOSE ZERO DEPOSIT?",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildArea("Speeds Up The Rental Process"),
                        _buildArea("Supports Accountable Tenant"),
                        _buildArea("Provides Security & Protection"),
                        _buildArea("Reduces Paperwork & Hassle"),
                        _buildArea("Helps To Attract A Wider Audience"),
                        SizedBox(
                          height: 25.h,
                        ),

                        CustomText(
                          text: "Tenants Deposit Options:",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "One of the most expensive parts of moving into any rental property is the deposit, which is why here at Proper Genies we and our landlords offer a number of options to you.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),


                        CustomText(
                          text: "Security Deposits",
                          color: AppColors.THEME_BUTTON,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "A traditional cash deposit costs the equivalent of 5 week’s rent. This money is held in a deposit scheme, so your money is protected. At the end of your rental period, the money is returned subject to any deductions you agree or the deposit scheme provider agrees we are owed.  We use DPS, one of the government-backed schemes.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        CustomText(
                          text: "Deposit Replacements",
                          color: AppColors.THEME_BUTTON,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: "Deposit replacements are products that are designed to give you, as the tenant, more choice. Our landlords will accept a Zero Deposit Guarantee. You purchase the Zero Deposit Guarantee, which costs the same as one week’s rent, and this buys the landlord the same cover as a security deposit.\nIf there are any deductions Zero Deposit uses TDS, one of the government-backed schemes, decides what you are responsible for. Zero Deposit then pays the landlord and you pay Zero Deposit.",
                          color: Colors.black,
                          // Red asterisk
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start, // Same size as the text
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
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
              color: Colors.black,
              // Red asterisk
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start, // Same size as the text
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
