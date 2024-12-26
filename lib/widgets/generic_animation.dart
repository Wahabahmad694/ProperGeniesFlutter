import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPlayer extends StatelessWidget {
  final String
      lottiePath; // Path to the Lottie animation (asset or network URL)
  final bool loop; // Whether the animation should loop
  final bool autoplay; // Whether the animation should autoplay on load
  final double? width; // Optional width of the animation
  final double? height; // Optional height of the animation

  // Constructor
  LottieAnimationPlayer({
    required this.lottiePath,
    this.loop = true,
    this.autoplay = true,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // If it's an asset, use Lottie.asset; if it's a network URL, use Lottie.network
    return Center(
      child: Lottie.asset(
        lottiePath, // Path to the Lottie JSON (from assets or network)
        width: width, // Optional width
        height: height, // Optional height
        repeat: loop, // Whether to loop the animation
        animate: autoplay, // Whether to autoplay the animation
      ),
    );
  }
}
