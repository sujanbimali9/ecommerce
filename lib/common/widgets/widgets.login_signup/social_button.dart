import 'package:ecommerce_flutter/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.outlined(
          onPressed: () async =>
              await LoginController.instance.loginWithGoogle(),
          icon: Image.asset(
            TImages.google,
            height: TSizes.iconLg,
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        IconButton.outlined(
          onPressed: () {},
          icon: Image.asset(
            TImages.facebook,
            height: TSizes.iconLg,
          ),
        ),
      ],
    );
  }
}
