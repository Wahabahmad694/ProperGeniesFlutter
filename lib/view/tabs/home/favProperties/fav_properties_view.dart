import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/tabs/home/favProperties/fav_properties_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/color_resources.dart';
import '../../../../widgets/custom_text.dart';
import '../../../propertyDetail/property_detail_view.dart';

class FavPropertiesView extends StatelessWidget {
  static const String route = '/FavPropertiesView';

  const FavPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavPropertyVm>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.Theme_blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        20,
                      ),
                      bottomRight: Radius.circular(
                        20,
                      ),
                    )),
                padding: const EdgeInsets.only(
                    top: 50, left: 10, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_outlined),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CustomText(
                                text: "Your Favourite Properties",
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ],
                        ),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.r),
                              color: AppColors.WHITE),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
              vm.isLoading
                  ? Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: const CircularProgressIndicator(
                        color: AppColors.Theme_blue,
                      ),
                    )
                  : Column(
                      children: [
                        vm.responseBody.favoriteProperties != null && vm.responseBody.favoriteProperties!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 30),
                                child: Column(
                                    children: [propertiesList(context, vm)]),
                              )
                            : Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 90.h),
                                      child: Image.asset(
                                        'assets/images/genie.PNG', // Foreground image
                                        width: 90.w, // Base size of the image
                                        height: 90.h,
                                      )),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                    )
            ],
          ),
        ),
      );
    });
  }
}

Widget propertiesList(BuildContext context, FavPropertyVm vm) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: vm.responseBody.favoriteProperties?.length ?? 0,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          print("id selected fav: ${vm.responseBody.favoriteProperties?[index].id}");
          Navigator.pushNamed(context, PropertyDetailView.route,
              arguments: vm.responseBody.favoriteProperties?[index].id);
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius
                  child: Image.network(
                    vm.responseBody.favoriteProperties?[index].photos?[0].url ??
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
                                    "£ ${vm.responseBody.favoriteProperties![index].price}",
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
                                        "${vm.responseBody.favoriteProperties![index].address}",
                                        35),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
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
                                            "x${vm.responseBody.favoriteProperties![index].orientation!.beds}",
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
                                            "x${vm.responseBody.favoriteProperties![index].orientation!.bathrooms}",
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
                                            "${vm.responseBody.favoriteProperties![index].department}",
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
