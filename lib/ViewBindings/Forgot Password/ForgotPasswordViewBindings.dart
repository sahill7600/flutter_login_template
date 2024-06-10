import 'package:apex_missions/Controller/Forgot%20Password/ForgotPasswordViewController.dart';
import 'package:get/get.dart';

class ForgotPasswordViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordViewController());
  }
}
