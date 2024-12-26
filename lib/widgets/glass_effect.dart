import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final Widget theChild;
  final double borderRadius;
  final double? x;
  final double? y;
  const FrostedGlassBox(
      {Key? key,
        required this.theWidth,
        required this.theHeight,
        required this.theChild,
        required this.borderRadius,
        this.x,
        this.y
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        //we use Stack(); because we want the effects be on top of each other,
        //  just like layer in photoshop.
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                //sigmaX is the Horizontal blur
                sigmaX: x??6.0,
                //sigmaY is the Vertical blur
                sigmaY: y??6.0,
              ),
              //we use this container to scale up the blur effect to fit its
              //  parent, without this container the blur effect doesn't appear.
              child: Container(),
            ),
            //gradient effect ==> the second layer of stack

            //child ==> the first/top layer of stack
            Center(child: theChild),
          ],
        ),
      ),
    );
  }
}
class FrostedGlassBoxTwo extends StatelessWidget {
  final double? theWidth;
  final double? theHeight;
  final Widget theChild;
  final double borderRadius;
  const FrostedGlassBoxTwo(
      {Key? key,
         this.theWidth,
         this.theHeight,
        required this.theChild,
        required this.borderRadius,
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        //we use Stack(); because we want the effects be on top of each other,
        //  just like layer in photoshop.
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                //sigmaX is the Horizontal blur
                sigmaX: 8.0,
                //sigmaY is the Vertical blur
                sigmaY: 8.0,
              ),
              //we use this container to scale up the blur effect to fit its
              //  parent, without this container the blur effect doesn't appear.
              child: Container(),
            ),
            //gradient effect ==> the second layer of stack
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      //begin color
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.15),
                    ]),
              ),
            ),

            //child ==> the first/top layer of stack
            Center(child: theChild),
          ],
        ),
      ),
    );
  }
}














