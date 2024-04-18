import 'package:ecommerce_flutter/features/authentication/controllers/on_boarding_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/widgets/on_boarding_next_button.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/widgets/on_boarding_dot_naviagtion.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (value) {
                controller.updatePageIndicator(value);
              },
              controller: controller.pageController,
              children: const [
                OnBoardingpage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingpage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingpage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3,
                )
              ],
            ),
            const OnBardingSkipButton(),
            const OnBoardingNextButton(),
            const OnBoardingDotNavigation()
          ],
        ),
      )),
    );
  }
}
