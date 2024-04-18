import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    this.showBorder = true,
    this.icon = Iconsax.search_normal,
    this.showBackgroundColor = true,
  }) : super(key: key);
  // final VoidCallback onTap;
  final bool showBackgroundColor, showBorder;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(TSizes.defaultSpace),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(TSizes.cardRadiusLg),
          ),
          color: showBackgroundColor
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: TColors.darkGrey,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Search in Store',
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
