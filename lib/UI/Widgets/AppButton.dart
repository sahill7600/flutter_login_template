import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Utils/Extensions.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String? text;
  double? height;
  double? width;
  Color? backGroundColor = AppColors.backgroundColor;
  Color? textColor = AppColors.textColor;
  VoidCallback? onPressed;
  double? radius;

  AppButton(
      {Key? key,
      this.text,
      this.width,
      this.height,
      this.onPressed,
      this.textColor,
      this.backGroundColor,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(
          width: width, height: height ?? SizeConfig.relativeHeight(8)),
      child: new ElevatedButton(
          child: new Text(text!.capitalizeCustom(),
              style: new TextStyle(color: textColor, fontSize: 18.0)),
          style: ElevatedButton.styleFrom(
            //elevation: elevation,
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    (radius! != null) ? radius! : height! / 2))),
          ),
          onPressed: onPressed),
    );
  }
}
