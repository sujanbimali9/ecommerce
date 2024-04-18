import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              TTexts.forgetPassword,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  label: Text(TTexts.email)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ResetPasswordScreen());
                  },
                  child: const Text(TTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
