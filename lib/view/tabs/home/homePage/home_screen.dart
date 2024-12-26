import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/propertyDetail/property_detail_view.dart';
import 'package:ProperGenies/view/tabs/home/allPropertiesList/all_properties_view.dart';
import 'package:ProperGenies/view/tabs/home/favProperties/fav_properties_view.dart';
import 'package:ProperGenies/view/tabs/more/services/lettings/lettings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/color_resources.dart';
import '../../../../widgets/CircleContainer.dart';
import '../../../../widgets/banner_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../animationScreen/animation_view.dart';
import '../../more/services/sales/sales_view.dart';
import 'homeVm.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          color: AppColors.Theme_blue,
          onRefresh: () async {
            vm.init();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Find Your Best",
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Real Estate",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, FavPropertiesView.route);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.Theme_blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const CustomBannerList(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LettingsView.route);
                          },
                          child: services("iv_landlord", "Landlords")),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SalesView.route);
                          },
                          child: services("iv_vendor", "Vendors")),
                      GestureDetector(
                          onTap: () {
                            final modal = {
                              'lottie': "comingSoon",
                              'title': "Stay tuned with ProperGenies new features coming soon to enhance your experience!",
                              'bypass': true
                            };
                            Navigator.pushNamed(context, AnimationView.route, arguments: modal);
                          }, child: services("icTenant", "Tenants")),
                      GestureDetector(
                          onTap: () {
                            {
                              Navigator.pushNamed(context, AllPropertiesView.route);
                            }
                          },
                          child: services("iv_buyer", "Buyers")),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Properties in ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'United ',
                                  style: TextStyle(
                                      color: AppColors.Theme_blue,
                                      // Red asterisk
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight
                                          .w600 // Same size as the text
                                      ),
                                ),
                                TextSpan(
                                  text: 'Kingdom',
                                  style: TextStyle(
                                      color: Colors.red, // Red asterisk
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight
                                          .w600 // Same size as the text
                                      ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AllPropertiesView.route);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              // Semi-transparent background
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppColors.Theme_blue, // Border color
                                width: 1.0, // Border width
                              )),
                          child: CustomText(
                            text: "See all",
                            color: AppColors.BUTTON_GRADIENT3,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  vm.isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: const CircularProgressIndicator(
                            color: AppColors.Theme_blue,
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              vm.responseBody.listing?.properties != null
                                  ? propertiesList(context, vm)
                                  : Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 90.h),
                                            child: Image.asset(
                                              'assets/images/genie.PNG', // Foreground image
                                              width: 90
                                                  .w, // Base size of the image
                                              height: 90.h,
                                            )),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "No Property found",
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget propertiesList(BuildContext context, HomeScreenVm vm) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: 5,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          print(
              "id selected: ${vm.responseBody.listing?.properties?[index].id}");
          Navigator.pushNamed(context, PropertyDetailView.route,
              arguments: vm.responseBody.listing?.properties?[index].id);
        },
        child: Container(
            height: 112.h,
            width: 353.w,
            // Green container's width
            padding: const EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius
                  child: Image.network(
                    vm.responseBody.listing!.properties![index].photos![0]
                            .url ??
                        "",
                    width: 90, // Adjust the width
                    height: 90, // Adjust the height
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  // This makes the yellow container take all available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Pushes items apart
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    "£ ${NumberFormat.decimalPattern("en_GB").format(vm.responseBody.listing!.properties![index].price ?? 0)}",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.Theme_blue,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "icMap".toSvgPath,
                                    height: 14.h,
                                    width: 14.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomText(
                                    text: splitTextByLength(
                                        "${vm.responseBody.listing!.properties![index].address}",
                                        35),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey, overflow: TextOverflow.ellipsis
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bed,
                                        size: 14,
                                        color: AppColors.THEME_BUTTON,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomText(
                                        text:
                                            "x${vm.responseBody.listing!.properties![index].orientation!.beds}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.hot_tub,
                                        size: 14,
                                        color: AppColors.THEME_BUTTON,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomText(
                                        text:
                                            "x${vm.responseBody.listing!.properties![index].orientation!.bathrooms}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.category,
                                        size: 14,
                                        color: AppColors.Theme_blue,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomText(
                                        text:
                                            "${vm.responseBody.listing!.properties![index].department}",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.Theme_blue,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: 10.h,
      );
    },
  );
}
