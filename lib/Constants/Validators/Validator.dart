import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:flutter/material.dart';

extension DocumentIdValidators on String {
  bool isValidPassword() {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool isValidEmail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(this);
  }
}

String? isRequiredField({required String? value, FocusNode? focusNode}) {
  if (value == null || value.isEmpty) {
    focusNode?.requestFocus();
    return "${LanguageConst.fieldCannotBeEmpty}!";
  } else {
    return null;
  }
}

String? validateName({required String? value, FocusNode? focusNode}) {
  if (value == null || value.isEmpty) {
    focusNode?.requestFocus();
    return "${LanguageConst.fieldCannotBeEmpty}!";
  } else {
    return null;
  }
}

String? validateEmail({required String? value, FocusNode? focusNode}) {
  if (value == null || value.isEmpty) {
    focusNode?.requestFocus();
    return "${LanguageConst.pleaseEnter} ${LanguageConst.emailAddress}!";
  } else if (!value.isValidEmail()) {
    focusNode?.requestFocus();
    return "${LanguageConst.enterValid} ${LanguageConst.emailAddress}!";
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return LanguageConst.pleaseEnterPwd;
  } else if (value.length < 3) {
    return LanguageConst.enterValidPwd;
  }
  return null;
}

String? validateConfirmPassword(String? value, String? password) {
  if (value!.isEmpty) {
    return LanguageConst.enterValidPwd;
  } else if (value != password) {
    return LanguageConst.passwordNotMatch;
  }
  return null;
}
