import 'package:ecommerce_flutter/common/widgets/products/cart/add_to_favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';

class TProductImage extends StatelessWidget {
  const TProductImage({
    Key? key,
    required this.image,
    this.isNetworkImage = false,
    this.height = 180,
    this.width,
    this.discoutPercentage,
    this.icon = Iconsax.heart5,
    this.iconColor = Colors.red,
    this.onIconPressed,
    this.padding,
  }) : super(key: key);

  final String image;
  final bool? isNetworkImage;
  final double? height;
  final double? width;
  final String? discoutPercentage;
  final IconData? icon;
  final Color? iconColor;
  final double? padding;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      height: height,
      width: width,
      radius: TSizes.productImageRadius,
      padding: EdgeInsets.all(padding ?? 0),
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TRoundedImage(
            image: image,
            width: double.infinity,
            isNetworkImage: isNetworkImage ?? false,
          ),
          if (discoutPercentage != null)
            Positioned(
              top: 8,
              left: 8,
              child: TRoundedContainer(
                backgroundColor: TColors.secondary.withOpacity(0.8),
                radius: TSizes.borderRadiusLg,
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text(
                  discoutPercentage!,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black),
                ),
              ),
            ),
          Positioned(
            right: 5,
            top: 5,
            child: TAddToFavouriteButton(onIconPressed: onIconPressed),
          ),
        ],
      ),
    );
  }
}
