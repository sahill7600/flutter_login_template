import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Drawer/DrawerMenuUserController.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/UI/Widgets/rich_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawerMenuUser extends StatelessWidget {
  DrawerMenuUser();

  DrawerMenuUserController drawerMenuUserController =
      Get.isRegistered() ? Get.find() : Get.put(DrawerMenuUserController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: gridLayout(),
        ));
  }

  Widget gridLayout() {
    List<MenuModel> listModel = [];

    listModel.add(MenuModel(
        1, AppIcons.homeDrawerIconSvg, LanguageConst.home.toString()));

    listModel.add(
        MenuModel(2, AppIcons.logOutIconSvg, LanguageConst.logout.toString()));

    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: List.generate(listModel.length, (index) {
          return containBarAdapter(listModel[index]);
        }),
      ),
    );
  }

  Widget containBarAdapter(MenuModel model) {
    return InkWell(
      onTap: () async {
        drawerMenuUserController.onClickMenu(model);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ProfileImage(icon: 'ic_contact_us.svg',size: 54.0,),
            Container(
              padding: EdgeInsets.all(SizeConfig.relativeSize(6)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.relativeSize(15))),
              ),
              child: new SvgPicture.asset(
                '${model.iconName}',
                allowDrawingOutsideViewBox: true,
                color: model.color,
                //  color: Colors.lightBlue,

                width: SizeConfig.relativeHeight(4.5),
                height: SizeConfig.relativeHeight(4.5),
              ),
            ),
            new RichTextView(
              model.name,
              margin: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
              textStyle: AppTextStyles.textStyle12black400(),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}

class MenuModel {
  String name;
  String iconName;
  int type;
  Color? color;

  MenuModel(this.type, this.iconName, this.name, {this.color});
}
