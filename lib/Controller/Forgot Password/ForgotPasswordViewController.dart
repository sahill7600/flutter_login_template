import 'package:apex_missions/Controller/BaseController.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  void forgotPassword() {
    if (formKey.currentState!.validate()) {}
    update();
  }
}
