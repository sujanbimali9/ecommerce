import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/address.dart';
import 'package:ecommerce_flutter/features/personalization/screens/setting_screen/widgets/setting_tile.dart';
import 'package:ecommerce_flutter/features/personalization/screens/setting_screen/widgets/user_profile_tile.dart';
import 'package:ecommerce_flutter/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/primary_header.dart';
import 'package:ecommerce_flutter/features/shop/screens/myorders/my_order_screen.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const UserProfileTile(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
              child: SafeArea(
                child: Column(
                  children: [
                    const TSectionHeading(
                      title: 'Account Settings',
                      showButton: false,
                    ),
                    TSettingTile(
                      title: 'My Addresses',
                      subtitle: 'Set shopping delivery addresses',
                      icon: Iconsax.safe_home,
                      onPressed: () => Get.to(() => const UserAddressScreen()),
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    TSettingTile(
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout',
                      icon: Iconsax.shopping_cart,
                      onPressed: () => Get.to(() => const CartScreen()),
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    TSettingTile(
                      title: 'My Order',
                      subtitle: 'Track your orders',
                      icon: Iconsax.bag_tick,
                      onPressed: () => Get.to(() => const MyOrderScreen()),
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    TSettingTile(
                      title: 'My Coupons',
                      subtitle: 'Manage your discount vouchers',
                      icon: Iconsax.discount_shape,
                      onPressed: () {},
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    TSettingTile(
                      title: 'Notifications',
                      subtitle:
                          'Manage notification ,block and unblock notification',
                      icon: Iconsax.notification,
                      borderRadius: TSizes.cardRadiusSm,
                      onPressed: () {},
                    ),
                    TSettingTile(
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected Account',
                      icon: Iconsax.security_card,
                      onPressed: () {},
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(
                      title: 'App Settings',
                      showButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingTile(
                      title: 'Load Data',
                      subtitle: 'Upload data to your cloud firebase',
                      icon: Iconsax.document_upload,
                      onPressed: () {},
                      borderRadius: TSizes.cardRadiusSm,
                    ),
                    TSettingTile(
                      title: 'Geolocation',
                      subtitle: 'Set recommends based on location',
                      icon: Iconsax.location,
                      borderRadius: TSizes.cardRadiusSm,
                      trailing: Switch(
                          activeColor: TColors.primary,
                          value: true,
                          onChanged: (value) {}),
                    ),
                    TSettingTile(
                      title: 'Safe Mode ',
                      subtitle: 'Hide the explicit products',
                      icon: Iconsax.security_user,
                      borderRadius: TSizes.cardRadiusSm,
                      trailing: Switch(
                          activeColor: TColors.primary,
                          value: false,
                          onChanged: (value) {}),
                    ),
                    TSettingTile(
                      title: 'Load Data',
                      subtitle: 'Upload data to your cloud firebase',
                      icon: Iconsax.image,
                      borderRadius: TSizes.cardRadiusSm,
                      trailing: Switch(
                          activeColor: TColors.primary,
                          splashRadius: 5,
                          value: false,
                          onChanged: (value) {}),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Logout',
                          )),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections * 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
