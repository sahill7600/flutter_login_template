// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:apex_missions/Constants/AppColors.dart';
// import 'package:apex_missions/Constants/AppIcons.dart';
// import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
// import 'package:apex_missions/Constants/PrefKeys.dart';
// import 'package:apex_missions/Constants/SizeConfig.dart';
// import 'package:apex_missions/DataHandler/Local/storage_helper.dart';
// import 'package:apex_missions/Routing/RouteNames.dart';
// import 'package:apex_missions/Services/NavigationService.dart';
// import 'package:apex_missions/Utils/LinearGradient.dart';
// import 'package:get/get.dart';
//
// class DrawerWidget extends StatelessWidget {
//   final String? versionName;
//
//   DrawerWidget({Key? key, this.versionName}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.85,
//       child: Column(
//         children: [
//           SizeConfig.verticalSpacer(8),
//           Padding(
//             padding: EdgeInsets.only(
//               left: SizeConfig.relativeWidth(5),
//             ),
//             child: Row(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     height: SizeConfig.relativeHeight(9),
//                     width: SizeConfig.relativeHeight(9),
//                     decoration: const BoxDecoration(
//                       color: AppColors.textColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//                 SizeConfig.horizontalSpacer(5),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "hello@gmail.com",
//                       style: TextStyle(
//                         color: AppColors.blackColor,
//                       ),
//                     ),
//                     Text(
//                       "Hello World",
//                       style: TextStyle(
//                         color: AppColors.blackColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizeConfig.verticalSpacer(2),
//           const Divider(color: AppColors.blackColor),
//           SizeConfig.verticalSpacer(2),
//           GestureDetector(
//             onTap: () {
//               NavigationService().pop();
//             },
//             child: customDrawerRowWidget(
//               AppIcons.bottomBarHomeIconSvg,
//               LanguageConst.home,
//             ),
//           ),
//           SizeConfig.verticalSpacer(2),
//           const Divider(color: AppColors.blackColor),
//           SizeConfig.verticalSpacer(2),
//           GestureDetector(
//             onTap: () {
//               logout();
//             },
//             child: customDrawerRowWidget(
//               AppIcons.logOutIconSvg,
//               LanguageConst.logout,
//             ),
//           ),
//           SizeConfig.verticalSpacer(2),
//           const Divider(color: AppColors.blackColor),
//           const Spacer(),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Text(
//               "${LanguageConst.version}: $versionName",
//               style: TextStyle(
//                 color: AppColors.blackColor,
//                 fontWeight: FontWeight.w400,
//                 fontSize: SizeConfig.setSp(14),
//               ),
//             ),
//           ),
//           SizeConfig.verticalSpacer(2),
//         ],
//       ),
//     );
//   }
//
//   Widget customDrawerRowWidget(String icon, String label) {
//     return Container(
//       color: AppColors.transparent,
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             icon,
//             width: SizeConfig.relativeHeight(3),
//             height: SizeConfig.relativeHeight(3),
//             color: AppColors.blackColor,
//           ),
//           SizeConfig.horizontalSpacer(5),
//           Text(
//             label,
//             style: TextStyle(
//               color: AppColors.blackColor,
//               fontSize: SizeConfig.setSp(18),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const Spacer(),
//           const Icon(Icons.keyboard_arrow_right, color: AppColors.blackColor),
//         ],
//       ).paddingOnly(
//         left: SizeConfig.relativeWidth(5),
//       ),
//     );
//   }
//
//   void logout() {
//     StorageHelper.instance.clear();
//     NavigationService().popAllAndNavigateTo(loginViewRoute)
import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Drawer/DrawerViewController.dart';
import 'package:apex_missions/UI/Drawer/DrawerMenuUser.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/UI/Widgets/ImageButton.dart';
import 'package:apex_missions/UI/Widgets/profile_image.dart';
import 'package:apex_missions/UI/Widgets/rich_text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  bool platformAllDelivery;

  DrawerWidget({this.platformAllDelivery = false});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  DrawerViewController drawerViewController =
      Get.isRegistered() ? Get.find() : Get.put(DrawerViewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawerViewController.initUi(
      widget.platformAllDelivery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        body: new LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: new ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: new IntrinsicHeight(
                      child: new Container(
                    color: Colors.white,
                    child: GetBuilder<DrawerViewController>(
                        id: 'main_view',
                        builder: (val) {
                          return new Column(
                            children: <Widget>[
                              SizeConfig.verticalSpacer(4),
                              profileWidget(),
                              Expanded(child: DrawerMenuUser()),
                              new Align(
                                alignment: FractionalOffset.bottomLeft,
                                child: new RichTextView(
                                  LanguageConst.version +
                                      " : ${drawerViewController.versionName}",
                                  textStyle:
                                      AppTextStyles.textStyle14DarkBlue400(),
                                  textAlign: TextAlign.right,
                                  margin: EdgeInsets.only(
                                      top: 16.0,
                                      bottom: 16.0,
                                      right: 16.0,
                                      left: 16.0),
                                ),
                              ),
                            ],
                          ).paddingSymmetric(
                              horizontal: SizeConfig.relativeWidth(5));
                        }),
                  ))));
        }),
      ),
    );
  }

  Widget profileWidget() {
    return Row(
      children: [
        ImageButton(
          icon: AppIcons.DrawerBackIconSvg,
          color: Colors.black,
          height: 20.0,
          width: 25.0,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new RichTextView(
              "userName",
              maxLines: 1,
              textStyle: AppTextStyles.textStyle16Black400(),
              textAlign: TextAlign.left,
              margin: EdgeInsets.only(left: 8.0),
            ),
            new RichTextView(
              "Phone",
              maxLines: 1,
              textStyle: AppTextStyles.textStyle12Gray400(),
              textAlign: TextAlign.left,
              margin: EdgeInsets.only(left: 8.0),
            ),
            new RichTextView(
              "email",
              maxLines: 1,
              textStyle: AppTextStyles.textStyle12Gray400(),
              textAlign: TextAlign.left,
              margin: EdgeInsets.only(left: 8.0),
            ),
          ],
        )),
        new ProfileImage(
          size: 55.0,
          backGroundColor: Colors.white,
          // url: userPic,
          icon: AppIcons.capturePhotoIconSvg,
          fit: BoxFit.cover,
          borderColor: /*(userProfile.userPicture != null &&
              userProfile.userPicture!.isNotEmpty)
              ? AppColors.lightGray
              :*/
              AppColors.lightRed,
          onPressed: () {
            //openProfileScreen();
          },
        )
      ],
    );
  }
}
