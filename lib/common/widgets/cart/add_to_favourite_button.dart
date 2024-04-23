import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TAddToFavouriteButton extends StatelessWidget {
  const TAddToFavouriteButton(
      {super.key, this.iconColor, this.icon, this.onIconPressed});

  final Color? iconColor;

  final IconData? icon;

  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularIcon(
      backgroundColor: dark
          ? TColors.black.withOpacity(0.9)
          : TColors.white.withOpacity(0.9),
      icon: icon,
      color: iconColor,
      onPressed: onIconPressed,
    );
  }
}
