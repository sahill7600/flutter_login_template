import 'dart:developer';

import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/DataHandler/Local/storage_helper.dart';
import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static logout() {
    StorageHelper.instance.clear();
    NavigationService().popAllAndNavigateTo(loginViewRoute);
  }

  static String readTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat("MM/dd/yyyy hh:mm a");
    return format.format(date);
  }

  static String getMonthDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat("MMMM d").format(date);
  }

  static String getYearMonthDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static String getDateMonth(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat("d MMMM yyyy");
    return format.format(date);
  }

  static String getYear(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat("yyyy");
    return format.format(date);
  }

  static String getFormatDateTimeFromStringFormat(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return readTimestamp(newDateTime.millisecondsSinceEpoch);
  }

  static String getFormatDateFromStringFormat(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd").parse(dateTime);
    return readTimestamp(newDateTime.millisecondsSinceEpoch).substring(0, 10);
  }

  static String getMonthDateString(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return getMonthDate(newDateTime.millisecondsSinceEpoch);
  }

  static String getDateMonthString(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd").parse(dateTime);
    return getDateMonth(newDateTime.millisecondsSinceEpoch);
  }

  static String getYearString(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return getYear(newDateTime.millisecondsSinceEpoch);
  }

  static String getDateinMonthFormat(String dateTime) {
    DateTime newDateTime = DateFormat("yyyy-MM-dd ").parse(dateTime);
    return newDateTime.toString();
  }

  static bool isValidateEmail(String value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regex = new RegExp(pattern);

    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(value);
  }

  static String dateDiff(String date) {
    DateTime now = DateTime.now();
    DateTime newDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
//    print(now.millisecondsSinceEpoch-newDateTime.millisecondsSinceEpoch);
    int dayDiff = now.difference(newDateTime).inDays;
    if (dayDiff >= 7) {
      int week = ((dayDiff) / 7).round();
      if (week >= 1) {
        return ((dayDiff) / 7).round().toString() + " " + "weeks ago";
      } else {
        return ((dayDiff) / 7).round().toString() + " " + "week ago";
      }
    } else {
      if (dayDiff <= 1) {
        if (dayDiff == 1) {
          return "$dayDiff day ago";
        } else {
          return "Today";
        }
      } else {
        return "$dayDiff days ago";
      }
    }
  }

  static String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd MMM, yyyy');
    String formatted = formatter.format(date);
    formatter = DateFormat.jm();

    formatted = formatted + " - " + formatter.format(date);

    return formatted;
  }

  static bool isMobileNumber(String phoneNumber, String defaultCountryCode) {
    if (phoneNumber == null) {
      return false;
    }
    if (phoneNumber.startsWith("5")) {
      phoneNumber = '0' + phoneNumber;
    }

    if (phoneNumber.startsWith("+" + defaultCountryCode) ||
        phoneNumber.startsWith(defaultCountryCode) ||
        phoneNumber.startsWith("0")) {
      List<String> arr = [
        "050",
        "052",
        "055",
        "056",
        "054",
        "058",
        "97150",
        "97152",
        "97155",
        "97156",
        "97154",
        "97158"
      ];
      String newNumber = phoneNumber.replaceFirst("+", "");
      for (String prefix in arr) {
        if (newNumber.startsWith(prefix)) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static String removeAllHtmlTags(String htmlText) {
    if (htmlText == null) return '';
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static String serverTimeFormate(DateTime dateTime) {
    return DateFormat("hh:mm a").format(dateTime);
  }

  static Future<bool> checkInternetConnectionAndShowMessage() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      log(">> No Connection Available <<");
      Get.snackbar("", LanguageConst.internetNotAvailable);
      return false;
    } else {
      log(">> Connection Available <<");
      return true;
    }
  }
}
