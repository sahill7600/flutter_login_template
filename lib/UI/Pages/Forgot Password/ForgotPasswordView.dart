import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Localization/LanguageConstants.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:apex_missions/Controller/Forgot%20Password/ForgotPasswordViewController.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:apex_missions/UI/Styling/AppTextStyles.dart';
import 'package:apex_missions/UI/Widgets/AppButton.dart';
import 'package:apex_missions/UI/Widgets/AppTextFormField.dart';
import 'package:apex_missions/UI/Widgets/BaseCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with BaseCommonWidget {
  ForgotPasswordViewController model = Get.put(ForgotPasswordViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: model,
      initState: (state) {},
      builder: (ForgotPasswordViewController controller) {
        return SafeArea(
          top: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: true,
              leading: IconButton(
                onPressed: () => NavigationService().pop(),
                icon: AppIcons.iconWidget(Icons.arrow_back),
                color: AppColors.blackColor,
              ),
              backgroundColor: AppColors.backgroundColor,
              title: Text(
                LanguageConst.forgotPassword,
                style: AppTextStyles.textStyle26Black400(),
              ),
            ),
            body: _getBody(),
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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizeConfig.verticalSpacer(8),
                SizeConfig.verticalSpacer(8),
                Expanded(
                  flex: 700,
                  child: Column(
                    children: [
                      AppTextFormField(
                        textHint: "${LanguageConst.email}",
                        controller: model.emailController,
                        textInputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        // padding: EdgeInsets.all(SizeConfig.relativeSize(4)),
                        // margin: EdgeInsets.all(SizeConfig.relativeSize()),
                        radius: SizeConfig.relativeSize(5),
                        isLogin: true,
                      ),
                    ],
                  ),
                ),
                SizeConfig.verticalSpacer(8),
                Expanded(
                  flex: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        text: LanguageConst.submit,
                        onPressed: model.forgotPassword,
                        radius: SizeConfig.relativeSize(5),
                      ),
                    ],
                  ),
                ),
                SizeConfig.verticalSpacer(2),
              ],
            ).paddingSymmetric(horizontal: SizeConfig.relativeWidth(5)),
          ),
        ),
      );
    });
  }
}
