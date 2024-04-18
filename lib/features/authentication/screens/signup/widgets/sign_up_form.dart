import 'package:ecommerce_flutter/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_verify_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/widgets/sign_up_terms_and_condition.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/widgets/sign_up_textfield.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SignUpTextField(null,
                      controller: controller.controller,
                      label: TTexts.username,
                      icon: Iconsax.user),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                    child: SignUpTextField(
                  null,
                  controller: controller.controller,
                  label: TTexts.username,
                  icon: Iconsax.user,
                ))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpTextField(null,
                controller: controller.controller,
                label: TTexts.username,
                icon: Iconsax.user_edit),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpTextField(null,
                controller: controller.controller,
                label: TTexts.email,
                icon: Iconsax.direct),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpTextField(null,
                controller: controller.controller,
                label: TTexts.phoneNo,
                icon: Iconsax.call),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpTextField(true,
                controller: controller.controller,
                label: TTexts.password,
                icon: Iconsax.password_check),
            const SizedBox(height: TSizes.spaceBtwItems),
            TermsAndConnditions(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpVerifyScreen(
                        email: 'sujanbimali999@gmail.com',
                      ));
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
