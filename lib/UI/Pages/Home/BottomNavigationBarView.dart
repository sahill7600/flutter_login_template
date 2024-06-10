import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Home/BottomNavigationBarViewController.dart';
import 'package:apex_missions/UI/Pages/Home/Widgets/BottomBarItem.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/UI/Widgets/BaseCommonWidget.dart';
import 'package:apex_missions/UI/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BottomNavigationBarView extends StatefulWidget {
  final int index;

  const BottomNavigationBarView({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView>
    with BaseCommonWidget {
  BottomNavigationBarViewController model =
      Get.put(BottomNavigationBarViewController());

  int pageIndex = 0;

  @override
  void initState() {
    getPackageInfo();
    super.initState();
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    model.version = packageInfo.version;
    pageIndex = widget.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(context, constraints);
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: AppColors.blackColor,
            // decoration: BoxDecoration(
            //   gradient: customLinearGradient(),
            // ),
          ),
          backgroundColor: AppColors.transparent,
          title: Text(
            getAppBarTitle(),
            style: AppTextStyles.textStyle18OffWhite400(),
          ),
          centerTitle: true,
        ),
        drawer: DrawerWidget(),
        body: model.pages[pageIndex],
        bottomNavigationBar: buildNavBar(context),
      );
    });
  }

  Container? buildNavBar(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(8),
      decoration: const BoxDecoration(
          // gradient: customLinearGradient(),
          color: AppColors.blackColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              pageIndex = 0;
              setState(() {});
            },
            child: BottomBarItem(
              iconName: pageIndex == 0
                  ? AppIcons.bottomBarDarkHomeIconSvg
                  : AppIcons.bottomBarHomeIconSvg,
              isCurrentItem: pageIndex == 0 ? true : false,
            ),
          ),
          GestureDetector(
            onTap: () {
              pageIndex = 1;
              setState(() {});
            },
            child: BottomBarItem(
              iconName: pageIndex == 1
                  ? AppIcons.bottomBarDarkPortfolioIconSvg
                  : AppIcons.bottomBarPortfolioIconSvg,
              isCurrentItem: pageIndex == 1 ? true : false,
            ),
          ),
          GestureDetector(
            onTap: () {
              pageIndex = 2;
              setState(() {});
            },
            child: BottomBarItem(
              iconName: pageIndex == 2
                  ? AppIcons.bottomBarDarkNewsFeedIconSvg
                  : AppIcons.bottomBarNewsFeedIconSvg,
              isCurrentItem: pageIndex == 2 ? true : false,
            ),
          ),
        ],
      ),
    );
  }

  String getAppBarTitle() {
    switch (pageIndex) {
      case 0:
        return LanguageConst.home;
      case 1:
        return LanguageConst.about;
      case 2:
        return LanguageConst.contact;
      default:
        return LanguageConst.home;
    }
  }
}
