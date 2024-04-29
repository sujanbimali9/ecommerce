import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_screen.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
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
              validator: TValidator.validateEmail,
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
            Obx(() {
              return TextFormField(
                controller: controller.passwordController,
                validator: (value) => TValidator.validate('password', value),
                autocorrect: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Iconsax.password_check,
                    ),
                    label: const Text(TTexts.password),
                    suffixIcon: TCircularIcon(
                        icon: controller.hidePassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value)),
              );
            }),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value);
                }),
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
                onPressed: controller.login,
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
