import 'dart:io';

import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/UI/Widgets/ImageButton.dart';
import 'package:apex_missions/UI/Widgets/rich_text_view.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final VoidCallback? onPressed;
  double size;
  double fontSize;
  Color fontColor;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry? margin;
  String? url;
  Color borderColor;
  Color backGroundColor;
  String icon;
  File? image;
  BoxFit fit;
  final TextStyle? textStyle;

  bool circleShape;

  //passing props in react style
  ProfileImage({
    this.url = "",
    this.image,
    this.circleShape = true,
    this.size = 100.0,
    this.fontSize = 32.0,
    this.fontColor = AppColors.lightRed,
    this.padding = const EdgeInsets.all(32.0),
    this.margin,
    this.borderColor = AppColors.lightGray,
    this.backGroundColor = const Color(0xFFB3BFC6),
    this.icon = "assets/icons/svgs/ic_capture_photo.svg",
    this.fit = BoxFit.cover,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (image != null && image!.path != '' && image!.path.isNotEmpty) {
      return new InkWell(
        onTap: onPressed,
        child: new Container(
          width: size,
          height: size,
          margin: margin,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: Colors.transparent,
            image: new DecorationImage(
              image: new FileImage(File(image!.path)),
              fit: fit,
            ),
            borderRadius: new BorderRadius.all(
                new Radius.circular((circleShape) ? (size / 2) : 7.2)),
            border: new Border.all(
              color: borderColor,
              width: 1.0,
            ),
          ),
        ),
      );
    } else if (url!.isNotEmpty) {
      if (url!.contains("http") ||
          url!.contains("www") ||
          url!.contains(".com")) {
        return new GestureDetector(
            onTap: onPressed,
            child: new Container(
              width: size,
              height: size,
              margin: margin,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                image: new DecorationImage(
                  image: url!.contains("/storage/")
                      ? new FileImage(File(url!)) as ImageProvider
                      : new NetworkImage(url!),
                  fit: fit,
                ),
                borderRadius: new BorderRadius.all(
                    new Radius.circular((circleShape) ? (size / 2) : 7.2)),
                border: new Border.all(
                  color: borderColor,
                  width: 1.0,
                ),
              ),
            ));
      } else {
        return new InkWell(
            onTap: onPressed,
            child: new Container(
              width: size,
              height: size,
              margin: margin,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                borderRadius: new BorderRadius.all(
                    new Radius.circular((circleShape) ? (size / 2) : 7.2)),
                border: new Border.all(
                  color: borderColor,
                  width: 1.0,
                ),
              ),
              child: new Center(
                child: RichTextView(
                  url![0],
                  textStyle: textStyle,
                  textAlign: TextAlign.center,
                  margin: EdgeInsets.all(4.0),
                ),
              ),
            ));
      }
    } else {
      return new RawMaterialButton(
        child: new ImageButton(
          icon: icon,
          width: size / 2,
          height: size / 2,
          margin: EdgeInsets.all(0.0),
        ),
        shape: circleShape
            ? new CircleBorder()
            : new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.2)),
        // shape: circleShape ? new CircleBorder() : new Border(),
        elevation: 1.0,
        fillColor: backGroundColor,
        padding: padding,
        constraints: BoxConstraints(maxHeight: size, maxWidth: size),
        onPressed: onPressed,
      );
    }
  }
}
