import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppFonts.dart';
import 'package:apex_missions/Constants/AppTheme.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static textStyle12black400() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFonts.font12,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle12Gray400() {
    return TextStyle(
      color: AppColors.darkGray,
      fontSize: AppFonts.font12,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle14White400() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: AppFonts.font14,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle14DarkBlue400() {
    return TextStyle(
      color: AppColors.textColor7,
      fontSize: AppFonts.font14,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle14DarkBlue400WithLineThrough() {
    return TextStyle(
        color: AppColors.textColor7,
        fontSize: AppFonts.font14,
        fontWeight: FontWeight.w400,
        fontFamily: AppTheme.celiasFont,
        decoration: TextDecoration.lineThrough);
  }

  static textStyle14DarkBlue400WithUnderline() {
    return TextStyle(
        color: AppColors.textColor7,
        fontSize: AppFonts.font14,
        fontWeight: FontWeight.w400,
        fontFamily: AppTheme.celiasFont,
        decoration: TextDecoration.underline);
  }

  static textStyle14Black400() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFonts.font14,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle14Gray400() {
    return TextStyle(
      color: AppColors.dividerColor,
      fontSize: AppFonts.font14,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle16Black400() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFonts.font16,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.celiasFont,
    );
  }

  static textStyle26Black400() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFonts.font26,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyle18OffWhite400() {
    return TextStyle(
      color: AppColors.backgroundColor,
      fontSize: AppFonts.font18,
      fontWeight: FontWeight.w600,
    );
  }

  static textStyle16OffWhite400() {
    return TextStyle(
      fontSize: AppFonts.font16,
      fontWeight: FontWeight.w600,
      color: AppColors.backgroundColor,
    );
  }

  static textStyleBlueColour() {
    return TextStyle(color: AppColors.textColor);
  }

  static textStyle14Black() {
    return TextStyle(
      fontSize: AppFonts.font13,
      color: AppColors.blackColor,
    );
  }

  static textStyle14Blue() {
    return TextStyle(
      fontSize: AppFonts.font14,
      color: AppColors.textColor,
    );

  } static textStyle16Blue() {
    return TextStyle(
      fontSize: AppFonts.font16,
      color: AppColors.textColor,
    );
  }

  static textStyle26Black() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFonts.font26,
      fontWeight: FontWeight.bold,
    );
  }
}
