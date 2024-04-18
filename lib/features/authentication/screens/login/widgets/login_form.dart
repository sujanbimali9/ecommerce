import 'package:ecommerce_flutter/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_screen.dart';
// import 'package:ecommerce_flutter/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = LoginController.instance;

    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                label: Text(TTexts.email),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.password_check,
                ),
                label: Text(TTexts.password),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: (selected) {}),
                const Text(TTexts.rememberMe),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const TNavigationmenu());
                },
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
