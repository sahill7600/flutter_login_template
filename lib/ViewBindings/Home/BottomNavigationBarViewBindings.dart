import 'package:apex_missions/Controller/Home/BottomNavigationBarViewController.dart';
import 'package:get/get.dart';

class BottomNavigationBarViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarViewController());
  }
}
