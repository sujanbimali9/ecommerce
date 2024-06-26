import 'package:ecommerce_flutter/common/success_screen/success_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/login_screen.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TSuccessScreen(
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            image: TImages.staticSuccessIllustration,
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
          ),
        ),
      ),
    );
  }
}
