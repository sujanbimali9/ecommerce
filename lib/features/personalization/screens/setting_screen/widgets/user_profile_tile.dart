import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance.user;
    return ListTile(
      leading: Obx(
        () => TRoundedImage(
          isNetworkImage: user.value.profilePicture.isNotEmpty,
          image: user.value.profilePicture.isNotEmpty
              ? user.value.profilePicture
              : TImages.user,
          height: 50,
          borderRadius: 25,
          width: 50,
        ),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(Iconsax.edit)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              user.value.firstName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
          ),
          Obx(
            () => Text(
              user.value.email,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
