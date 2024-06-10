import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final Function onTap;
  final bool? isSelected;

  CheckBoxWidget({Key? key, this.isSelected, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: isSelected!
          ? Image.asset(
              AppIcons.checkBoxSelectIcon,
              height: SizeConfig.relativeHeight(2.5),
              width: SizeConfig.relativeHeight(2.5),
            )
          : Container(
              height: SizeConfig.relativeHeight(2.5),
              width: SizeConfig.relativeHeight(2.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.blueLinearColor,
                  // width: SizeConfig.relativeWidth(1),
                ),
              ),
            ),
    );
  }
}
