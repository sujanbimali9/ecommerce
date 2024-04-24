import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityAddRemove extends StatelessWidget {
  const TProductQuantityAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        TCircularIcon(
          width: 32,
          height: 32,
          icon: Iconsax.minus,
          color: dark ? TColors.white : TColors.black,
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          '1',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          width: 35,
          height: 35,
          icon: Iconsax.add,
          color: dark ? TColors.white : TColors.black,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
