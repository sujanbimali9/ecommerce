import 'package:ecommerce_flutter/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('skip'),
      ),
    );
  }
}
