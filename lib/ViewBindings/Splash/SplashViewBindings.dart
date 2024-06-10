import 'package:apex_missions/Controller/Splash/SplashViewController.dart';
import 'package:get/get.dart';

class SplashViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewController());
  }
}