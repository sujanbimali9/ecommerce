import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    final size = THelperFunctions.screenSize();
    Get.dialog(
        barrierDismissible: false,
        PopScope(
            canPop: false,
            child: Container(
              width: size.width,
              height: size.height,
              color: THelperFunctions.isDarkMode(Get.overlayContext!)
                  ? TColors.dark
                  : TColors.white,
              child: Center(
                  child:
                      TAnimationLoaderWidget(text: text, animation: animation)),
            )));
  }

  static void removeLoader() {
    Get.back();
  }
}
