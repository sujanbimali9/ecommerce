import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/change_name/change_name_screen.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';

import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance.user;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Obx(() => TRoundedImage(
                  isNetworkImage: user.value.profilePicture.isNotEmpty,
                  image: user.value.profilePicture.isNotEmpty
                      ? user.value.profilePicture
                      : TImages.user,
                  height: 80,
                  width: 80,
                  borderRadius: 40,
                )),
            TextButton(
                onPressed: () {}, child: const Text('change profile picture')),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(endIndent: 30, indent: 30),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(
              title: 'Profile Information',
              showButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Obx(() => TProfileMenu(
                onPressed: () => Get.to(() => const UpdateNameScreen()),
                title: 'Name',
                value: user.value.fullName)),
            Obx(() => TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: user.value.userName)),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(endIndent: 30, indent: 30),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(
                title: 'Personal Information', showButton: false),
            Obx(() => TProfileMenu(
                onIconPressed: () {},
                title: 'User Id',
                value: user.value.id,
                icon: Iconsax.copy)),
            Obx(() => TProfileMenu(
                onPressed: () {}, title: 'E-mail', value: user.value.email)),
            Obx(() => TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: user.value.phoneNo)),
            TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
            TProfileMenu(
                onPressed: () {}, title: 'Date of Birth', value: '2060-07-05'),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(endIndent: 30, indent: 30),
            const SizedBox(height: TSizes.spaceBtwSections),
            OutlinedButton(
                onPressed: () =>
                    UserController.instance.deleteAccountWarningPopup(context),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)))
          ],
        ),
      ),
    );
  }
}
