import 'dart:async';

import 'package:apex_missions/Constants/PrefKeys.dart';
import 'package:apex_missions/Controller/BaseController.dart';
import 'package:apex_missions/DataHandler/Local/storage_helper.dart';
// import 'package:apex_missions/Model/UserData.dart';
import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/Utils/Logger.dart';

class SplashViewController extends BaseController {
  bool? _isLogin;

  startTime() async {
    var duration = Duration(seconds: 5);

    return Timer(duration, route);
  }

  void route() {
    openLandingScreen();
    // checkPermissionMicAudio();
  }

  Future<void> openLandingScreen() async {
    //_isLogin = StorageHelper.instance.getBoolValue(PrefKeys.isLogin);
    // bool isFirstTime =
    //     StorageHelper.instance.getBoolValue(PrefKeys.isFirstTime);
    // int tripID = StorageHelper.instance.getIntValue(PrefKeys.tripId);
    //
    // Logger.get().log("tripID >>>> $tripID");
    // tripID != null && tripID != 0
    //     ? redirectWithClearBackStack(homeViewRoute)
    //     : isFirstTime
    //         ? redirectWithClearBackStack(loginViewRoute)
    //         : redirectWithClearBackStack(loginViewRoute);
     redirectWithClearBackStack(loginViewRoute);
    // redirectWithClearBackStack(goalMasterViewRoute);
    // redirectWithClearBackStack(groupGoalSelectionViewRoute);
    //redirectWithClearBackStack(chooseTripTypeViewRoute);
    // if (isFirstTime) {
    //   redirectWithClearBackStack(loginViewRoute);
    // } else {
    //   redirectWithClearBackStack(onBoardingViewRoute);
    // }
  }
}
