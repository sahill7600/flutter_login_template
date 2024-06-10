import 'package:apex_missions/Constants/AppColors.dart';
import 'package:flutter/material.dart';

LinearGradient customLinearGradient() {
  return LinearGradient(
    colors: [AppColors.blueLinearColor, AppColors.blueLinearColorWithOpacity],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(0.0, 1.0),
  );
}
