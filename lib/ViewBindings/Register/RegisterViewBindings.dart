import 'package:apex_missions/Controller/Register/RegisterViewController.dart';
import 'package:get/get.dart';

class RegisterViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterViewController());
  }
}
