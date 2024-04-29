import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onPressed});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(animation,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.6),
        const SizedBox(height: TSizes.defaultSpace),
        if (showAction)
          SizedBox(
            width: 250,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
              onPressed: onPressed,
              child: Text(
                actionText ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TColors.light),
              ),
            ),
          )
      ]),
    );
  }
}

class TLoaders {
  static void _showSnackbar(
      {required String title,
      String message = '',
      required backgroundColor,
      int? duration,
      double? margin,
      IconData? icons}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration ?? 3),
      margin: EdgeInsets.all(margin ?? 20),
      icon: Icon(icons ?? Iconsax.warning_2, color: TColors.white),
    );
  }

  static successSnackBar({
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showSnackbar(
        title: title,
        backgroundColor: TColors.primary,
        duration: duration,
        icons: Iconsax.check,
        margin: 10);
  }

  static costomToast({required String title}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.darkerGrey.withOpacity(0.9)
                  : TColors.grey.withOpacity(0.9)),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }

  static void warningSnackBar({
    required String title,
    String message = '',
  }) {
    _showSnackbar(title: title, backgroundColor: Colors.orange);
  }

  static void errorSnackBar({
    required String title,
    String message = '',
  }) {
    _showSnackbar(
        title: title, backgroundColor: Colors.red.shade600, message: message);
  }
}
