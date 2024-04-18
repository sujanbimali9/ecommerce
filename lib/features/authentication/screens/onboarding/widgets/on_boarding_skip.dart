import 'package:ecommerce_flutter/features/authentication/controllers/on_boarding_controller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBardingSkipButton extends StatelessWidget {
  const OnBardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TDeviceUtils.getAppBarHeight(),
      top: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('skip'),
      ),
    );
  }
}
