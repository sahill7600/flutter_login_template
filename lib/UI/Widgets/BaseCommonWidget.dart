import 'dart:developer';

import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/AppIcons.dart';
import 'package:apex_missions/Constants/Enums/ViewState.dart';
import 'package:apex_missions/Constants/SizeConfig.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BaseCommonWidget {
  showMessageInSnackBar(String message, bool isError) {
    try {
      Get.snackbar(
        "",
        "",
        isDismissible: true,
        maxWidth: double.infinity,
        backgroundColor:
            isError ? AppColors.errorColor : AppColors.successColor,
        colorText: AppColors.backgroundColor,
        duration: const Duration(milliseconds: 1500),
        titleText: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.backgroundColor,
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Widget getProgressBar(ViewStateEnum viewState) {
    if (viewState == ViewStateEnum.busy) {
      return Container(
        color: Colors.white.withAlpha(204),
        child: Center(
          child: Lottie.asset(AppIcons.loadingIcon),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget cachedImageWidget(String url,
      {double height = 20, double width = 20}) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Image.network(
          url,
        );
      },
      height: SizeConfig.relativeHeight(height),
      width: SizeConfig.relativeHeight(width),
      // progressIndicatorBuilder: (context, url, progress) => const Center(
      //     child:  CircularProgressIndicator(color: AppColors.blueLinearColor,)),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.blueLinearColor,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

// Widget loadFileImage({File path, double height, double width}) {
//   return Container(
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       image: DecorationImage(fit: BoxFit.fill, image: FileImage(path)),
//     ),
//   );
// }
}
