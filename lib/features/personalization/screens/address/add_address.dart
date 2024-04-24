import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/widgets/add_address_form_fiels.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Add new Adresses',
            style: Theme.of(context).textTheme.headlineMedium,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                const AddAddressFormField(title: 'Name', icon: Iconsax.user),
                const SizedBox(height: TSizes.spaceBtwItems),
                const AddAddressFormField(
                    title: 'Phone Number', icon: Iconsax.mobile),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Row(
                  children: [
                    Expanded(
                        child: AddAddressFormField(
                            title: 'Street', icon: Iconsax.location)),
                    SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                        child: AddAddressFormField(
                            title: 'Postal Code', icon: Iconsax.code4)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Row(
                  children: [
                    Expanded(
                        child: AddAddressFormField(
                            title: 'City', icon: Iconsax.building)),
                    SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                        child: AddAddressFormField(
                            title: 'State', icon: Iconsax.activity)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const AddAddressFormField(
                    title: 'Country', icon: Iconsax.global),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
