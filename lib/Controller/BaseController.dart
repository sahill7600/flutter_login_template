import 'dart:developer';

import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/Enums/ViewState.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  ViewStateEnum _state = ViewStateEnum.idle;

  ViewStateEnum get state => _state;

  final NavigationService _navigationService = locator<NavigationService>();

  /// Change The Value Of View State

  void setLoaderState(ViewStateEnum viewState) {
    if (state != viewState) _state = viewState;
    update();
  }

  // All navigation service declare here

  redirectToPage(String routeName, {dynamic arguments}) {
    _navigationService.navigateTo(routeName, arguments: arguments);
  }

  redirectWithClearBackStack(String routeName, {dynamic arguments}) {
    _navigationService.popAllAndNavigateTo(routeName, arguments: arguments);
  }

  Future<void> redirectToPageWithAwait(String routeName,
      {dynamic arguments}) async {
    await _navigationService.navigateTo(routeName, arguments: arguments);
    return;
  }

  redirectWithPop(String routeName, {dynamic arguments}) {
    _navigationService.navigateToAndPop(routeName, arguments: arguments);
  }

  pop() {
    _navigationService.pop();
  }

  showMessageInSnackBar(String message, bool isError) {
    try {
      Get.snackbar(
        "",
        "",
        isDismissible: true,
        maxWidth: double.infinity,
        backgroundColor:
            isError ? AppColors.errorColor : AppColors.successColor,
        colorText: AppColors.backgroundColor,
        titleText: Text(
          message,
          style: AppTextStyles.textStyle16OffWhite400(),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
