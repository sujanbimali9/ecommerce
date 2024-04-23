import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    this.onPressed,
    this.splashRadius,
    this.borderRadius,
    required this.title,
    required this.value,
    this.icon,
    this.onIconPressed,
  });
  final VoidCallback? onPressed, onIconPressed;
  final String title, value;
  final double? splashRadius, borderRadius;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
      radius: splashRadius,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            const SizedBox(
              width: TSizes.fontSizeSm,
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              child: IconButton(
                  onPressed: onIconPressed,
                  icon: Icon(icon ?? Iconsax.arrow_right_3, size: 18)),
            )
          ],
        ),
      ),
    );
  }
}
