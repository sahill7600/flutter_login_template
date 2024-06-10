import 'package:apex_missions/Utils/Logger.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DrawerViewController extends GetxController {
  String versionName = "";

  void initUi(bool platformAllDelivery) {
    _getDetail();
  }

  _getDetail() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    Logger.get().log("versionName : $versionName");
    update(['bottom_navigation', 'main_view']);
  }
}
