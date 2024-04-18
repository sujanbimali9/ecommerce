import 'package:ecommerce_flutter/features/authentication/controllers/on_boarding_controller.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 10,
      child: SmoothPageIndicator(
          onDotClicked: controller.dotClick,
          effect: ExpandingDotsEffect(
            dotHeight: 5,
            activeDotColor: dark ? TColors.light : TColors.dark,
          ),
          controller: controller.pageController,
          count: 3),
    );
  }
}
