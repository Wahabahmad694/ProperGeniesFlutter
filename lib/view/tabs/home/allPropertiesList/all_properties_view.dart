import 'package:ProperGenies/data/model/response/PropertyListingResponseBody.dart';
import 'package:ProperGenies/helpers/string_helpers.dart';
import 'package:ProperGenies/view/tabs/home/allPropertiesList/all_properties_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/color_resources.dart';
import '../../../../widgets/custom_text.dart';
import '../../../propertyDetail/property_detail_view.dart';

class AllPropertiesView extends StatelessWidget {
  static const String route = '/AllPropertiesView';

  const AllPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllPropertiesVm>(
      // Specify ViewModel type here
      builder: (context, vm, _) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.Theme_blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 50, left: 10, right: 20, bottom: 10),
                child: Row(
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
                          text: "All We Got",
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360.r),
                        color: AppColors.WHITE,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.house,
                          size: 30,
                          color: AppColors.THEME_BUTTON,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          !vm.isLoading) {
                        vm.getPropertyListing(vm.currentPage);
                      }
                      return true;
                    },
                    child: ListView.separated(
                      controller: vm.scrollController,
                      itemCount: vm.properties.length + (vm.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == vm.properties.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        final property = vm.properties[index];
                        return _propertyListItem(
                            context, property); // Replace with your card widget
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _propertyListItem(BuildContext ctx, Properties property) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(ctx, PropertyDetailView.route,
            arguments: property.id);
      },
      child: Container(
        height: 112.h,
        width: 353.w,
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
                property.photos![0].url ?? "",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                "£ ${NumberFormat.decimalPattern("en_GB").format(property.price ?? 0)}",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.Theme_blue,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "icMap".toSvgPath,
                                height: 14.h,
                                width: 14.w,
                              ),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: splitTextByLength(
                                    "${property.address}", 35),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.bed,
                                      size: 14, color: AppColors.THEME_BUTTON),
                                  SizedBox(width: 5.w),
                                  CustomText(
                                    text: "x${property.orientation!.beds}",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(width: 5.w),
                              Row(
                                children: [
                                  Icon(Icons.hot_tub,
                                      size: 14, color: AppColors.THEME_BUTTON),
                                  SizedBox(width: 5.w),
                                  CustomText(
                                    text: "x${property.orientation!.bathrooms}",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(width: 5.w),
                              Row(
                                children: [
                                  Icon(Icons.category,
                                      size: 14, color: AppColors.Theme_blue),
                                  SizedBox(width: 5.w),
                                  CustomText(
                                    text: "${property.department}",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.Theme_blue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
