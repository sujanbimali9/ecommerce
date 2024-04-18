import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;

  const CustomAppBar(
      {super.key,
      this.title,
      this.actions,
      this.showBackArrow = false,
      this.leadingIcon,
      this.leadingOnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
