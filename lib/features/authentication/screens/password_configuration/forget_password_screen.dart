import 'package:ecommerce_flutter/features/authentication/controllers/forget_password_controller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
            Form(
              key: controller.formKey,
              child: TextFormField(
                controller: controller.emailController,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    label: Text(TTexts.email)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: controller.forgetPassword,
                  child: const Text(TTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
