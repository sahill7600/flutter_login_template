
import 'package:flutter/material.dart';

class AppIcons {
  /// app's all icons declared here like (svg,png or json)format

  static const String _svg = "assets/icons/svgs/";
  static const String _drawables = "assets/icons/drawables/";
  static const String _lottie = "assets/lotties/";

  ///Mention all lottie file paths here
  static String loadingIcon = _lottie + "loader.json";
  static String loadingIcon1 = _lottie + "loading.json";
  static String loadingIcon2 = _lottie + "loading2.json";

  ///Mention all drawables file paths here
  static String checkBoxSelectIcon = _drawables + "check_box_select.png";
  static String apexlogobgIcon = _drawables + "apexlogobg.png";
  static String SplashIconSvg = _drawables + "splash_screen.png";

  ///Mention all SVG file paths here



  /// Bottom bar navigation icons
  static String bottomBarHomeIconSvg = _svg + "home.svg";
  static String bottomBarPortfolioIconSvg = _svg + "portfolio.svg";
  static String bottomBarNewsFeedIconSvg = _svg + "news_feeds.svg";
  static String bottomBarServarchFundIconSvg = _svg + "search_fund.svg";

  static String bottomBarDarkHomeIconSvg = _svg + "home_dark.svg";
  static String bottomBarDarkPortfolioIconSvg = _svg + "portfolio_dark.svg";
  static String bottomBarDarkNewsFeedIconSvg = _svg + "news_feeds_dark.svg";
  static String bottomBarDarkSearchFundIconSvg = _svg + "search_fund_dark.svg";
  static String verveLogoSvg = _svg + "ic_verve_logo.svg";
  static String logOutIconSvg = _svg + "ic_logout_yellow.svg";
  static String homeDrawerIconSvg = _svg + "ic_home_purple.svg";
  static String DrawerBackIconSvg = _svg + "ic_back_arrow.svg";
  static String checkBoxSelectIconSvg = _svg + "ic_checkbox_select.svg";
  static String checkBoxUnselectIconSvg = _svg + "ic_checkbox_unselect.svg";
  static String capturePhotoIconSvg = _svg + "ic_capture_photo.svg";




  static Widget iconWidget(IconData iconName) {
    return Icon(iconName);
  }
}
