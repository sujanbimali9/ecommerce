import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReauthenticateUserScreen extends StatelessWidget {
  const ReauthenticateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Re-Authenticate',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Obx(() => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        TValidator.validate('password', value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: TCircularIcon(
                            icon: controller.hidePassword.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash,
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value),
                        labelText: TTexts.password),
                  )),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: controller.reauthenticateUser,
                    child: const Text('Delete Account')),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
