import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  String? textHint;
  double? radius;
  TextInputType? textInputType;
  EdgeInsets? margin = EdgeInsets.only(top: 12.0, bottom: 12.0);
  EdgeInsets? padding;
  TextEditingController? controller;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  EdgeInsets? paddingText;
  final int? maxLength;
  bool isLogin = false;
  Widget? suffixWidget;
  bool isObsecureText = false;

  //passing props in react style
  AppTextFormField(
      {this.textHint,
      this.padding,
      this.margin,
      this.radius,
      this.paddingText,
      this.textInputType,
      this.maxLength,
      this.controller,
      this.textCapitalization = TextCapitalization.words,
      this.textInputAction = TextInputAction.next,
      this.isObsecureText = false,
      this.suffixWidget = null,
      this.isLogin = false});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    bool textVisibility = true;

    return (new Container(
      margin: widget.margin,
      padding: widget.padding,
      // height: SizeConfig.relativeHeight(6.2),
      alignment: Alignment.center,
      child: new TextFormField(
        keyboardType: widget.textInputType,
        inputFormatters: (widget.textInputType == TextInputType.phone)
            ? [
                new LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ]
            : [],
        obscureText: widget.isObsecureText,
        decoration: new InputDecoration(
          hintText: widget.textHint,
          border: InputBorder.none,
          isDense: true,
          // contentPadding: EdgeInsets.only(left: SizeConfig.relativeWidth(4), top: SizeConfig.relativeHeight(2.5)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.relativeWidth(3),
              vertical: SizeConfig.relativeHeight(2.8)),
          suffixIcon: widget.suffixWidget,
        ),
        style: AppTextStyles.textStyle14DarkBlue400(),
        controller: widget.controller,
        textCapitalization: widget.textCapitalization,
        textAlign: TextAlign.start,
      ),
      decoration: new BoxDecoration(
        color: widget.isLogin ? AppColors.lightGray : Colors.white,
        borderRadius: new BorderRadius.all(
            Radius.circular(widget.radius ?? SizeConfig.relativeSize(5))),
      ),
    ));
  }
}
