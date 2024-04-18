import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCountIcon extends StatelessWidget {
  const TCartCountIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
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
                color: iconColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text('3',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: TColors.white, fontSizeFactor: 0.8)),
              ),
            ))
      ],
    );
  }
}
