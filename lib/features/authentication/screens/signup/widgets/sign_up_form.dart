import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/widgets/sign_up_terms_and_condition.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validate(TTexts.firstName, value),
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                      label: Text(
                        TTexts.firstName,
                      ),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                    child: TextFormField(
                  validator: (value) =>
                      TValidator.validate(TTexts.lastName, value),
                  controller: controller.lastName,
                  decoration: const InputDecoration(
                    label: Text(TTexts.lastName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              validator: (value) => TValidator.validate(TTexts.username, value),
              controller: controller.userName,
              decoration: const InputDecoration(
                label: Text(TTexts.username),
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(TTexts.email),
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(TTexts.phoneNo),
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                autocorrect: false,
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                decoration: InputDecoration(
                    label: const Text(TTexts.password),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: TCircularIcon(
                        icon: controller.hidePassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TermsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
