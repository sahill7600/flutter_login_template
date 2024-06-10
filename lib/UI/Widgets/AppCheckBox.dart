import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/UI/Widgets/ImageButton.dart';
import 'package:apex_missions/UI/Widgets/rich_text_view.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  String title;
  EdgeInsetsGeometry? margin;
  bool isSelect;
  bool enable;
  final double fontSize;
  final Color color;
  final VoidCallback? onChecked;
  final TextOverflow overflow;
  final TextStyle? textStyleEnable;
  final TextStyle? textStyleDisable;

  AppCheckBox(
    this.title, {
    this.margin,
    this.isSelect = false,
    this.enable = true,
    this.fontSize = 14.0,
    this.color = Colors.black12,
    this.overflow = TextOverflow.clip,
    this.onChecked,
    this.textStyleEnable,
    this.textStyleDisable,
  });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: enable ? onChecked : () {},
      child: new Container(
        margin: margin,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                enable
                    ? new ImageButton(
                        width: SizeConfig.relativeHeight(3.5),
                        height: SizeConfig.relativeHeight(3.5),
                        icon: isSelect
                            ? AppIcons.checkBoxSelectIconSvg
                            : AppIcons.checkBoxUnselectIconSvg,
                        color: AppColors.textColor,
                      )
                    : new ImageButton(
                        width: SizeConfig.relativeHeight(3.5),
                        height: SizeConfig.relativeHeight(3.5),
                        icon: isSelect
                            ? AppIcons.checkBoxSelectIconSvg
                            : AppIcons.checkBoxUnselectIconSvg,
                        color: AppColors.darkGray,
                      ),
                new Container(
                  width: 20.0,
                  height: 20.0,
                  color: Colors.transparent,
                  // color: enable ? Colors.transparent : color,
                  // color: enable ? Colors.transparent :  Application.cssButtonBusinessAlternative,
                ),
              ],
            ),
            Flexible(
              child: new RichTextView(
                title,
                textOverflow: overflow,
                margin: EdgeInsets.only(left: 8.0),
                textAlign: TextAlign.left,
                textStyle: enable ? textStyleEnable : textStyleDisable,
              ),
            )
          ],
        ),
      ),
    );
  }
}
