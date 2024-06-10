import 'package:apex_missions/Controller/Login/LoginViewController.dart';
import 'package:get/get.dart';

class LoginViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewController());
  }
}
