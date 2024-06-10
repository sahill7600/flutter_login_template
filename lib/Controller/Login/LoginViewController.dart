
import 'package:apex_missions/Constants/Enums/ViewState.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/PrefKeys.dart';
import 'package:apex_missions/Controller/BaseController.dart';
import 'package:apex_missions/DataHandler/Local/storage_helper.dart';
import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/Utils/Logger.dart';
import 'package:apex_missions/Utils/Utils.dart';
import 'package:flutter/cupertino.dart';

class LoginViewController extends BaseController {
  bool isPasswordShow = true;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  // TextEditingController emailController =
  //     TextEditingController(text: "tester@gmail.com");
  // TextEditingController passwordController =
  //     TextEditingController(text: "123456");
  TextEditingController passwordController = TextEditingController();

  void loginUser() {
    loginUserApiCall();
  }

  bool isValidInput() {
    String message = "";
    bool isValid;

    if (emailController.text.isEmpty) {
      showMessageInSnackBar(LanguageConst.enterEmailAddress, true);
      isValid = false;
    } else if (!Utils.isValidateEmail(emailController.text.trim())) {
      showMessageInSnackBar(
          "${LanguageConst.enterValid} ${LanguageConst.emailAddress}!", true);
      isValid = false;
    } else if (passwordController.text.isEmpty) {
      showMessageInSnackBar(LanguageConst.enterPassword, true);
      isValid = false;
    } else if (passwordController.text.length < 6) {
      showMessageInSnackBar(LanguageConst.passwordLength, true);
      isValid = false;
    } else {
      isValid = true;
    }

    if (message != "") {
      showMessageInSnackBar(message, false);
    }

    return isValid;
  }

void loginUserApiCall() {
  if (isValidInput()) {
    setLoaderState(ViewStateEnum.busy);
    redirectWithClearBackStack(homeViewRoute);
  }}
  // void loginUserApiCall() {
  //   if (isValidInput()) {
  //     setLoaderState(ViewStateEnum.busy);
  //     try {
  //       ApiManager.get()
  //           .loginUser(emailController.text, passwordController.text)
  //           .then((response) async {
  //         if (response.body.status != null && response.body.status == 2) {
  //           showMessageInSnackBar(response.body.message!, true);
  //         }
  //         if (response.isOk() && response.body.isSuccess()) {
  //           setLoaderState(ViewStateEnum.idle);
  //           StorageHelper.instance.clear();
  //           LoginResponse datamodel = LoginResponse(
  //             data: response.body.data,
  //           );
  //           StorageHelper.instance.clear();
  //           StorageHelper.instance
  //               .setValue(PrefKeys.authToken, response.body.data!.token);
  //
  //           StorageHelper.instance.setUserData(response.body.data!);
  //           if (response.body.data != null &&
  //               response.body.data!.video != null) {
  //             StorageHelper.instance.setValue(PrefKeys.devotionalVideoUrl,
  //                 response.body.data!.video!.devotionalsVideo);
  //             StorageHelper.instance.setValue(PrefKeys.groupGoalVideoUrl,
  //                 response.body.data!.video!.groupGoalVideo);
  //             StorageHelper.instance.setValue(PrefKeys.rSIVideoUrl,
  //                 response.body.data!.video!.rsiPersonalGoalVideo);
  //             StorageHelper.instance.setValue(PrefKeys.welcomeVideoUrl,
  //                 response.body.data!.video!.welcomeVideo);
  //           }
  //           if (response.body.data != null &&
  //               response.body.data!.friend != null) {
  //             StorageHelper.instance.setValue(PrefKeys.friendsName,
  //                 response.body.data!.friend!.rsiFriendName);
  //             StorageHelper.instance.setValue(PrefKeys.friendsZipcode,
  //                 response.body.data!.friend!.rsiFriendZipcode);
  //           }
  //           if (response.body.data != null &&
  //               response.body.data!.trip != null) {
  //             StorageHelper.instance
  //                 .setValue(PrefKeys.tripId, response.body.data!.trip!.tripId);
  //           }
  //           if (response.body.data!.welcome != null &&
  //               response.body.data!.welcome == 1) {
  //             redirectToPage(welcomeViewRoute);
  //           } else {
  //             if (response.body.data! != null) {
  //               TripAdded? tripData = response.body.data!.trip;
  //               redirectWithClearBackStack(homeViewRoute, arguments: tripData);
  //             }
  //           }
  //           // redirectToPage(loginSuccessViewRoute,
  //           //     arguments: response.body.data!);
  //         } else {
  //           showMessageInSnackBar(response.body.getMessage(), true);
  //           setLoaderState(ViewStateEnum.idle);
  //         }
  //       });
  //     } catch (e) {
  //       setLoaderState(ViewStateEnum.idle);
  //       Logger.get().log(e);
  //     }
  //   }
  // }
}