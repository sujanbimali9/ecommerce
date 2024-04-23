import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCountIcon extends StatelessWidget {
  const TCartCountIcon({
    super.key,
    this.onPressed,
    this.iconColor,
    this.text = '',
  });

  final VoidCallback? onPressed;
  final Color? iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.xs),
          child: IconButton(
              onPressed: onPressed, icon: const Icon(Iconsax.shopping_bag)),
        ),
        Positioned(
            top: 3,
            right: 0,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: iconColor ?? (dark ? TColors.dark : TColors.light),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(text,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                        fontSizeFactor: 0.8,
                        color: (dark ? TColors.white : TColors.black))),
              ),
            ))
      ],
    );
  }
}
