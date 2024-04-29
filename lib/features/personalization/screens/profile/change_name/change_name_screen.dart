import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/update_name_controller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        TValidator.validate('first name', value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    validator: (value) =>
                        TValidator.validate('first name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async => await controller.updateName(),
                    child: const Text('Save')))
          ],
        ),
      )),
    );
  }
}
