import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/verify_email_controller.dart';

class SignUpVerifyScreen extends StatelessWidget {
  const SignUpVerifyScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    TImages.deliveredEmailIllustration,
                  ),
                  Text(
                    TTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    TTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.checkEmailVerificaitonStatus();
                      },
                      child: const Text(TTexts.tContinue),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text(
                      TTexts.resendEmail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(CupertinoIcons.clear)))
            ],
          ),
        ),
      ),
    );
  }
}
