import 'package:ecommerce_flutter/features/authentication/controllers/on_boarding_controller.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      right: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(
              side: BorderSide.none,
            ),
            backgroundColor: dark ? TColors.primary : TColors.black),
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
