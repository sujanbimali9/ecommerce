import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/image/cirrcular_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';

import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const TCircularImage(image: TImages.user, height: 80, width: 80),
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
            TProfileMenu(
                onPressed: () {}, title: 'Name', value: 'Sujan Bimali'),
            TProfileMenu(
                onPressed: () {}, title: 'Username', value: 'Sujan Bimali'),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(endIndent: 30, indent: 30),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(
                title: 'Personal Information', showButton: false),
            TProfileMenu(
                onIconPressed: () {},
                title: 'User Id',
                value: '33483',
                icon: Iconsax.copy),
            TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'Sujanbimali999@gmail.com'),
            TProfileMenu(
                onPressed: () {}, title: 'Phone Number', value: '9814383738'),
            TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
            TProfileMenu(
                onPressed: () {}, title: 'Date of Birth', value: '2060-07-05'),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(endIndent: 30, indent: 30),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextButton(
                onPressed: () {},
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)))
          ],
        ),
      ),
    );
  }
}
