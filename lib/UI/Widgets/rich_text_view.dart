import 'package:flutter/material.dart';



class RichTextView extends StatelessWidget {
  final String text;
  final Key? textKey;

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final TextAlign textAlign;
  final Color? bgColor;
  final bool hasUnderLine;
  final bool hasLineThrough;
  final int? maxLines;
  final TextOverflow textOverflow;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;

  final VoidCallback? onPressed;
  final VoidCallback? onDoubleTap;
  final TextStyle? textStyle;


  //passing props in react style
  RichTextView(this.text,
      {this.textKey,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.textAlign = TextAlign.left,
      this.bgColor,
      this.hasUnderLine = false,
      this.hasLineThrough = false,
      this.maxLines,
      this.textOverflow = TextOverflow.ellipsis,
      this.decoration,
      this.alignment,
      this.onPressed,
      this.onDoubleTap,
      this.textStyle,
      });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      onDoubleTap: onDoubleTap,
      child:  Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          color: bgColor,
          alignment: alignment,
          child: RichText(
            key: textKey,
            maxLines: maxLines,
            overflow: textOverflow,
            text:  TextSpan(
                text: text,
                style: textStyle),
            textAlign: textAlign,
          ),
          decoration: decoration),
    );
  }
}
