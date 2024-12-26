import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_resources.dart';

class CustomBannerList extends StatefulWidget {
  const CustomBannerList({super.key});

  @override
  _CustomBannerListState createState() => _CustomBannerListState();
}

class _CustomBannerListState extends State<CustomBannerList> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/banner4.jpg',
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }
  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % _images.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ImageBanner(imagePath: _images[index]), // Use ImageBanner widget
              );
            },
          ),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              height: 6.h,
              width: _currentIndex == index ? 20.w : 8.w,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? AppColors.Theme_blue.withOpacity(0.7)
                    : AppColors.THEME_BUTTON,
                borderRadius: BorderRadius.circular(8.r),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ImageBanner extends StatelessWidget {
  final String imagePath;

  const ImageBanner({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
