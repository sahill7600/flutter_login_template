import 'package:flutter/material.dart';

class AppPaddings {
  static EdgeInsets nonePadding = const EdgeInsets.all(0.0);
  static EdgeInsets defaultPadding = const EdgeInsets.all(8.0);
  static EdgeInsets defaultPadding16 = const EdgeInsets.all(16.0);
  static EdgeInsets defaultPadding4 = const EdgeInsets.all(4.0);
  static EdgeInsets defaultPadding2 = const EdgeInsets.all(2.0);
  static EdgeInsets defaultPadding24 = const EdgeInsets.all(24.0);
  static EdgeInsets defaultPadding36 = const EdgeInsets.all(36.0);

  static EdgeInsets horizontal4 = const EdgeInsets.symmetric(horizontal: 4);
  static EdgeInsets horizontal16 = const EdgeInsets.symmetric(horizontal: 16.0);
  static EdgeInsets horizontal24 = const EdgeInsets.symmetric(horizontal: 24.0);
  static EdgeInsets horizontal28 = const EdgeInsets.symmetric(horizontal: 28.0);
  static EdgeInsets horizontal36 = const EdgeInsets.symmetric(horizontal: 36.0);
  static EdgeInsets horizontal12 = const EdgeInsets.symmetric(horizontal: 12.0);
  static EdgeInsets horizontal8 = const EdgeInsets.symmetric(horizontal: 8.0);

  static EdgeInsets vertical4 = const EdgeInsets.symmetric(vertical: 4);
  static EdgeInsets vertical8 = const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets vertical28 = const EdgeInsets.symmetric(vertical: 28);
  static EdgeInsets vertical12 = const EdgeInsets.symmetric(vertical: 12);
  static EdgeInsets vertical16 = const EdgeInsets.symmetric(vertical: 16);
  static EdgeInsets vertical20 = const EdgeInsets.symmetric(vertical: 20);

  static EdgeInsets paddingUp4Side8 =
  const EdgeInsets.symmetric(vertical: 4, horizontal: 8);
  static EdgeInsets paddingUp8Side4 =
  const EdgeInsets.symmetric(vertical: 8, horizontal: 4);
  static EdgeInsets paddingUp12Side8 =
  const EdgeInsets.symmetric(vertical: 12, horizontal: 8);
  static EdgeInsets paddingUp8Side12 =
  const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  static EdgeInsets paddingUp12Side4 =
  const EdgeInsets.symmetric(vertical: 12, horizontal: 4);
  static EdgeInsets paddingUp4Side12 =
  const EdgeInsets.symmetric(vertical: 4, horizontal: 12);

  static EdgeInsets paddingRight4 = const EdgeInsets.only(right: 4);
  static EdgeInsets paddingLeft4 = const EdgeInsets.only(left: 4);
  static EdgeInsets paddingUp4 = const EdgeInsets.only(top: 4);
  static EdgeInsets paddingDown4 = const EdgeInsets.only(bottom: 4);
  static EdgeInsets paddingRight8 = const EdgeInsets.only(right: 8);
  static EdgeInsets paddingLeft8 = const EdgeInsets.only(left: 8);
  static EdgeInsets paddingUp8 = const EdgeInsets.only(top: 8);
  static EdgeInsets paddingDown8 = const EdgeInsets.only(bottom: 8);

  static getContentPadding(
      {double left = 4,
        double top = 2.5,
        double right = 4,
        double bottom = 2.5}) {
    return EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );
  }

  static getSymmetricPadding({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }
}
