import 'package:apex_missions/Constants/AppColors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  AppDecorations._();

  static BoxDecoration buttonBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.backgroundColor,
  );

  static const TextStyle summaryTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.backgroundColor,
  );
  // static OutlineInputBorder inActiveBorder = const OutlineInputBorder(
  //   borderRadius: BorderRadius.all(
  //     Radius.circular(13),
  //   ),
  //   borderSide: BorderSide(
  //     color: AppColor.blueAccentColor,
  //     width: 2,
  //   ),
  // );

  // static const focusedBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.all(
  //     Radius.circular(13),
  //   ),
  //   borderSide: BorderSide(
  //     color: AppColor.primaryColor,
  //     width: 2,
  //   ),
  // );

  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(13),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  );
}
