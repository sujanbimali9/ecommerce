import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.iconSize,
    this.width,
    this.height,
    this.backgroundColor,
    this.color,
    this.icon,
    this.onPressed,
    this.radius = 100,
  });

  final double? iconSize, width, height;
  final Color? backgroundColor, color;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
        height: height,
        width: width,
        radius: radius,
        backgroundColor: backgroundColor,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon ?? Iconsax.heart5,
              size: iconSize ?? TSizes.lg,
              color: color,
            )));
  }
}
