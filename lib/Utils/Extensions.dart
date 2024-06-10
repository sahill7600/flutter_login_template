import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/UI/Styling/AppPaddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension StringChecks on String? {
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}

extension CustomWidget on Widget {
  /// Padding extension example
  /// Text("Value of the counter is $value").paddingAll16()
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget screenPadding(double width) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(width)),
        child: this,
      );

  Widget paddingSymmetricHorizontal(double padding) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(padding)),
        child: this,
      );

  Widget paddingSymmetric(
          {required double vertical, required double horizontal}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget paddingAll4() => Padding(
        padding: AppPaddings.defaultPadding4,
        child: this,
      );

  Widget paddingAllDefault() => Padding(
        padding: AppPaddings.defaultPadding,
        child: this,
      );

  Widget paddingAll16() => Padding(
        padding: AppPaddings.defaultPadding16,
        child: this,
      );

  Widget paddingAll24() => Padding(
        padding: AppPaddings.defaultPadding24,
        child: this,
      );

  Widget paddingAll36() => Padding(
        padding: AppPaddings.defaultPadding36,
        child: this,
      );

  Widget paddingAll2() => Padding(
        padding: AppPaddings.defaultPadding2,
        child: this,
      );

  Widget paddingHorizontal8() => Padding(
        padding: AppPaddings.horizontal8,
        child: this,
      );

  Widget paddingHorizontal12() => Padding(
        padding: AppPaddings.horizontal12,
        child: this,
      );

  Widget paddingHorizontal16() => Padding(
        padding: AppPaddings.horizontal16,
        child: this,
      );

  Widget paddingHorizontal24() => Padding(
        padding: AppPaddings.horizontal24,
        child: this,
      );

  Widget paddingHorizontal28() => Padding(
        padding: AppPaddings.horizontal28,
        child: this,
      );

  Widget paddingHorizontal36() => Padding(
        padding: AppPaddings.horizontal36,
        child: this,
      );

  Widget paddingVertical8() => Padding(
        padding: AppPaddings.vertical8,
        child: this,
      );

  Widget paddingVertical4() => Padding(
        padding: AppPaddings.vertical4,
        child: this,
      );

  Widget paddingVertical28() => Padding(
        padding: AppPaddings.vertical28,
        child: this,
      );

  Widget paddingVertical12() => Padding(
        padding: AppPaddings.vertical12,
        child: this,
      );

  Widget paddingVertical16() => Padding(
        padding: AppPaddings.vertical16,
        child: this,
      );

  Widget paddingVertical20() => Padding(
        padding: AppPaddings.vertical20,
        child: this,
      );

  Widget paddingUpSide48() => Padding(
        padding: AppPaddings.paddingUp4Side8,
        child: this,
      );

  Widget paddingUpSide412() => Padding(
        padding: AppPaddings.paddingUp4Side12,
        child: this,
      );

  Widget paddingUpSide84() => Padding(
        padding: AppPaddings.paddingUp8Side4,
        child: this,
      );

  Widget paddingUpSide812() => Padding(
        padding: AppPaddings.paddingUp8Side12,
        child: this,
      );

  Widget paddingUpSide124() => Padding(
        padding: AppPaddings.paddingUp12Side4,
        child: this,
      );

  Widget paddingUpSide128() => Padding(
        padding: AppPaddings.paddingUp12Side8,
        child: this,
      );

  /// Common cubits and listeners
  // Widget addNetworkListener() => StreamBuilder(
  //     stream: ConnectionStatus().connectionChange,
  //     builder: (context, snapshot) {
  //       return Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           this,
  //           (!snapshot.hasData || snapshot.data == false)
  //               ? const IgnorePointer(
  //                   ignoring: false,
  //                   child: Align(
  //                     alignment: Alignment.bottomCenter,
  //                     child: BaseInternet(),
  //                   ),
  //                 )
  //               : Container(),
  //         ],
  //       );
  //     });

  Widget addCustomAppBarStyle({Color? backgroundColor}) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
        ),
        child: this,
      );
}

void onWidgetDidBuild({required Function callback}) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    callback();
  });
}

extension StringExtension on String {
  //223
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String capitalizeCustom() {
    return "${toTitleCase()}";
  }
  // String capitalizeCustom() {
  //   return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  // }
}
