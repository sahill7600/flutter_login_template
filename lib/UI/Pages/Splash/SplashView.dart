import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Splash/SplashViewController.dart';
import 'package:apex_missions/UI/Widgets/ImageButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewController model =
      Get.isRegistered() ? Get.find() : Get.put(SplashViewController());

  @override
  void initState() {
    super.initState();
    model.startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Material(color: AppColors.containerColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          SizeConfig().init(context, constraints);
          return Stack(

            children: [
              Center(
                child: Image.asset(AppIcons.apexlogobgIcon,
                    width: SizeConfig.relativeWidth(50.5),
                height: SizeConfig.relativeWidth(50.5),),
              ),
              // ImageButton(
              //   isPNG: true,
              //   width: SizeConfig.screenWidth,
              //   fit: BoxFit.fill,
              //   icon: AppIcons.SplashIconSvg,
              //  // icon: AppIcons.apexlogobgIcon,
              // ),
              Align(
                alignment: Alignment.bottomCenter + Alignment(0, -0.15),
                child: CircularProgressIndicator(
                  strokeWidth: 7,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.blueAccentColor,
                  ),
                  backgroundColor: AppColors.blueLinearColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
