import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/add_address.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/widgets/single_address_card.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: TColors.primary,
          onPressed: () => Get.to(() => const AddAddressScreen()),
          child: const Icon(Iconsax.add, color: TColors.white)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: TSizes.md),
          itemBuilder: (context, index) =>
              TSingleAddress(isSelected: index == 1 ? true : false),
          itemCount: 5,
        ),
      ),
    );
  }
}
