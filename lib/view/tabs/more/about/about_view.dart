import 'package:ProperGenies/utils/color_resources.dart';
import 'package:ProperGenies/view/tabs/more/about/about_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_constant.dart';
import '../../../../widgets/CircleContainerSVG.dart';
import '../../../../widgets/custom_text.dart';

class AboutView extends StatelessWidget {
  static const String route = '/AboutView';

  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutVm>(builder: (context, vm, _) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "",
            fontWeight: FontWeight.w700,
            fontSize: 10.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.Theme_blue,
          centerTitle: true,
        ),
        backgroundColor: AppColors.Theme_blue,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CustomText(
                    text: "Welcome to ProperGenies",
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: Colors.white,
                  ),
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: Container(
                width: AppConstants.getScreenWidth(context),
                decoration: const BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        30,
                      ),
                      topLeft: Radius.circular(
                        30,
                      ),
                    )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [

                        CustomText(
                          text: "What we Provides",
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: AppColors.THEME_BUTTON,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Company Overview: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'A private real estate company offering \npremium solutions for buying, selling, and renting properties ',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '24/7 Assistance:',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Unique real estate support available online \nor via phone, anytime, day or night',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Customer-Centric Approach: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Focused on fulfilling all real  \nestate needs with top-notch service and results.',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Versatility: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Assistance for diverse needs—buying, selling,       \nrenting, or seeking real estate advice.',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Commitment: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Dedicated to offering the best possible             \nexperience and delivering desired outcomes.',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            CustomText(
                              text: "•",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                              color: AppColors.BUTTON_GRADIENT3,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Core Values: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Strong emphasis on communication,                   \nprofessionalism, and customer satisfaction.',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          text: "Our location",
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: AppColors.THEME_BUTTON,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 200.h, // Specify the height of the box
                          width: 350.w,// Specify the width of the box
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GoogleMap(
                              onMapCreated: vm.onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: vm.initialPosition,
                                zoom: 11.0,
                              ),
                              markers: vm.markers,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          text: "Contact Us",
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: AppColors.THEME_BUTTON,
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8.w,),

                            Icon(Icons.add_location,size: 25,color: AppColors.BUTTON_GRADIENT3,),
                            SizedBox(width: 8.w,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Head Office Address: ',
                                    style: TextStyle(
                                        color: AppColors.Theme_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Proper Genies Ltd,Space House  \nBusiness Centre, Suite 13, Abbey Road, London, NW10 7SU',
                                        style: TextStyle(
                                            color: Colors.grey, // Red asterisk
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight
                                                .w600 // Same size as the text
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8.w,),

                            Icon(Icons.email,size: 22,color: AppColors.BUTTON_GRADIENT3,),
                            SizedBox(width: 10.w,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                     vm.launchEmail("info@propergenies.co.uk", "For General Information");
                                  },
                                  child: CustomText(
                                    text: "info@propergenies.co.uk",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: AppColors.Theme_blue,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8.w,),
                            Icon(Icons.phone,size: 22,color: AppColors.BUTTON_GRADIENT3,),
                            SizedBox(width: 10.w,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    vm.launchDialer("0207 9711 481");
                                  },
                                  child: CustomText(
                                    text: "0207 9711 481",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: AppColors.Theme_blue,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8.w,),
                            Icon(Icons.access_time,size: 22,color: AppColors.BUTTON_GRADIENT3,),
                            SizedBox(width: 10.w,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Mon-Fri: 9am to5pm \nSat: 10am to 3pm \nSun: Closed",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: AppColors.Theme_blue,
                                )
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h,),
                        CustomText(
                          text: "Follow Us",
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: AppColors.THEME_BUTTON,
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  vm.openSocial("https://www.facebook.com/propergenies/");
                                },
                                child: servicesSv("fb")),
                            GestureDetector(
                                onTap: () {
                                  vm.openSocial("https://www.instagram.com/propergenies/");
                                },
                                child: servicesSv("insta")),
                            GestureDetector(
                                onTap: () {
                                  vm.openSocial("https://www.youtube.com/channel/UCLbKQ06cH71EN91e-sWDpTQ");
                                },
                                child: servicesSv("youtube")),
                            GestureDetector(
                                onTap: () {
                                  vm.openSocial("https://www.linkedin.com/company/proper-genies/about/");
                                },
                                child: servicesSv("linkedIn")),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      );
    });
  }
}
