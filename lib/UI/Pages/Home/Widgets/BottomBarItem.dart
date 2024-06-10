import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  final String? iconName;
  final bool? isCurrentItem;

  const BottomBarItem({Key? key, this.iconName, this.isCurrentItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconName!,
          width: SizeConfig.relativeHeight(3.5),
          height: SizeConfig.relativeHeight(3.5),
        ),
        SizeConfig.verticalSpacer(1),
        isCurrentItem!
            ? Container(
                height: SizeConfig.relativeHeight(0.5),
                width: SizeConfig.relativeWidth(5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.backgroundColor),
                    color: AppColors.backgroundColor),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  /*String getIconName() {
    switch(index){
      case 0:
        return isCurrentItem!
            ? AppIcons.bottomBarDarkHomeIconSvg
            : AppIcons.bottomBarHomeIconSvg;
      case 1:
        return isCurrentItem!
            ? AppIcons.bottomBarDarkPortfolioIconSvg
            : AppIcons.bottomBarPortfolioIconSvg;
      case 2:
        return index == 2 && isCurrentItem!
            ? AppIcons.bottomBarDarkMoneyMarketFundIconSvg
            : AppIcons.bottomBarMoneyMarketFundIconSvg;
      case 3:
        return index == 3 && isCurrentItem!
            ? AppIcons.bottomBarDarkSearchFundIconSvg
            : AppIcons.bottomBarSearchFundIconSvg;
      case 4:
        return index == 4 && isCurrentItem!
            ? AppIcons.bottomBarDarkNewsFeedIconSvg
            : AppIcons.bottomBarNewsFeedIconSvg;
      default:
        return AppIcons.bottomBarPortfolioIconSvg;
    }
  }*/
}
