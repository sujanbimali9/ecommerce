import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.title,
    required this.price,
    required this.shop,
    this.isverified = false,
  });
  final String title, price, shop;
  final bool isverified;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProductTitleText(text: title, smallText: true),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              Text(shop,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(width: TSizes.sm),
              if (isverified)
                const Icon(
                  Iconsax.verify5,
                  color: TColors.primary,
                  size: TSizes.iconXs,
                )
            ],
          ),
          Row(
            children: [
              Text('\$$price',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ],
      ),
    );
  }
}
