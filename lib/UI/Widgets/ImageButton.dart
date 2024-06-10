import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageButton extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  String? icon;
  Color? color;
  Color? bgColor;
  bool? isPNG;
  Decoration? decoration;
  final VoidCallback? onTap;
  BoxFit? fit;

  //passing props in react style
  ImageButton({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.icon,
    this.color,
    this.bgColor,
    this.isPNG = false,
    this.decoration,
    this.onTap,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    // return (new InkWell(
    //   onTap: onTap,
    //   child: new Container(
    //     margin: margin,
    //     padding: padding,
    //     color: bgColor,
    //     height: height,
    //     width: width,
    //     child: isPNG
    //         ? new Image.asset(
    //             "assets/" + icon!,
    //             color: color,
    //           )
    //         : new SvgPicture.asset(
    //             "assets/" + icon!,
    //             allowDrawingOutsideViewBox: false,
    //             color: color,
    //           ),
    //     decoration: decoration,
    //   ),
    // ));
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: new Container(
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        decoration: decoration,
        child: isPNG!
            ? new Image.asset(
           icon!,
          color: color,
        )
            : new SvgPicture.asset(
          icon!,
          allowDrawingOutsideViewBox: false,
          color: color,
          fit: fit ?? BoxFit.contain,
        ),
      ),
    );
  }
}
