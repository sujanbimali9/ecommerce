import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomBuyAndAddToCart extends StatelessWidget {
  const TBottomBuyAndAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItems / 2),
      child: Row(
        children: [
          TCircularIcon(
            width: 40,
            height: 40,
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
            width: 40,
            height: 40,
            icon: Iconsax.add,
            color: dark ? TColors.white : TColors.black,
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(TSizes.xs / 2)),
                  onPressed: () {},
                  child: const Text('Buy'))),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Expanded(
              flex: 3,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(TSizes.xs / 2)),
                  onPressed: () {},
                  child: const Text('Add to Cart'))),
        ],
      ),
    );
  }
}
