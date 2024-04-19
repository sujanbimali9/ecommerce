import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddToCartButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double horizontalPadding, verticalPadding, borderRadius;
  final String text;
  final VoidCallback? onPressed;
  final double? height, width;

  const AddToCartButton({
    super.key,
    this.backgroundColor = TColors.primary,
    this.icon = Iconsax.shopping_cart,
    this.horizontalPadding = TSizes.sm,
    this.verticalPadding = TSizes.xs,
    this.borderRadius = TSizes.borderRadiusSm,
    this.text = 'Add to Cart',
    this.onPressed,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Align(
      alignment: Alignment.center,
      child: TCircularContainer(
        height: height,
        onPressed: onPressed,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        radius: borderRadius,
        backgroundColor: backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: TSizes.sm),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: dark ? TColors.light : TColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
