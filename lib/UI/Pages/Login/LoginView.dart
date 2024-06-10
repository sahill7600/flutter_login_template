import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Login/LoginViewController.dart';
import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/UI/Widgets/AppButton.dart';
import 'package:apex_missions/UI/Widgets/AppCheckBox.dart';
import 'package:apex_missions/UI/Widgets/AppTextFormField.dart';
import 'package:apex_missions/UI/Widgets/BaseCommonWidget.dart';
import 'package:apex_missions/Utils/socal_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseCommonWidget {
  LoginViewController model =
      Get.isRegistered() ? Get.find() : Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: model,
      initState: (state) {},
      builder: (LoginViewController controller) {
        return SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              SizeConfig().init(context, constraints);
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.backgroundColor,
                body: _getBody(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _getBody() {
    return Stack(
      children: <Widget>[
        _getBaseContainer(),
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer() {
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    return SingleChildScrollView(
      child: Form(
        key: model.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizeConfig.verticalSpacer(8),
            // SvgPicture.asset(
            //   AppIcons.verveLogoSvg,
            //   width: SizeConfig.relativeHeight(18),
            //   height: SizeConfig.relativeHeight(18),
            // ),
            // SizeConfig.verticalSpacer(8),
            Text(
              LanguageConst.signIn,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: SizeConfig.setSp(26),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizeConfig.verticalSpacer(8),
            AppTextFormField(
              textHint: "${LanguageConst.email}",
              controller: model.emailController,
              textInputType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              // padding:EdgeInsets.all(12.0),
              // margin: EdgeInsets.only(top: 16.0),
              radius: SizeConfig.relativeSize(5),
              isLogin: true,
            ),
            SizeConfig.verticalSpacer(3),
            AppTextFormField(
              controller: model.passwordController,
              textHint: LanguageConst.password,
              radius: SizeConfig.relativeSize(5),
              isLogin: true,
              paddingText: EdgeInsets.zero,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              isObsecureText: model.isPasswordShow,
              suffixWidget: IconButton(
                onPressed: () {
                  model.isPasswordShow = !model.isPasswordShow;
                  model.update();
                },
                icon: model.isPasswordShow
                    ? AppIcons.iconWidget(Icons.visibility_off_outlined)
                    : AppIcons.iconWidget(Icons.visibility_outlined),
              ),
            ),
            SizeConfig.verticalSpacer(2),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Flexible(
            //       child: AppCheckBox(
            //         LanguageConst.rememberMe,
            //         isSelect: model.isRemember,
            //         enable: true,
            //         textStyleDisable: AppTextStyles.textStyle14Gray400(),
            //         textStyleEnable: AppTextStyles.textStyle14Black400(),
            //         overflow: TextOverflow.visible,
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         model.redirectToPage(forgotPasswordViewRoute);
            //       },
            //       child: Text(
            //         LanguageConst.forgotPasswordWithQuestionMark,
            //         style: AppTextStyles.textStyleBlueColour(),
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    model.redirectToPage(forgotPasswordViewRoute);
                  },
                  child: Text(
                    LanguageConst.forgotPasswordWithQuestionMark,
                    style: AppTextStyles.textStyleBlueColour(),
                  ),
                ),
              ],
            ),
            SizeConfig.verticalSpacer(8),
            AppButton(
              text: LanguageConst.signIn,
              onPressed: model.loginUser,
              radius: SizeConfig.relativeSize(5),
            ),
            SizeConfig.verticalSpacer(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalCard(
                  icon: "assets/icons/svgs/google-icon.svg",
                  press: () {},
                ),
                SocalCard(
                  icon: "assets/icons/svgs/facebook-2.svg",
                  press: () {},
                ),
                // SocalCard(
                //   icon: "assets/icons/twitter.svg",
                //   press: () {},
                // ),
              ],
            ),
            SizeConfig.verticalSpacer(8),
            RichText(
              text: TextSpan(
                text: LanguageConst.dontHaveAccount,
                style: AppTextStyles.textStyle14Black(),
                children: [
                  TextSpan(
                      text: LanguageConst.register,
                      style: AppTextStyles.textStyle14Blue(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService().navigateTo(registerViewRoute);
                        }),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: SizeConfig.relativeWidth(5)),
      ),
    );
  }
}
