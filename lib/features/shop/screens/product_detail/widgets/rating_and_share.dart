import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Iconsax.star1,
          color: Colors.amber,
          size: 24,
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 2),
        Text.rich(TextSpan(children: [
          TextSpan(text: '4.0', style: Theme.of(context).textTheme.bodyLarge),
          const TextSpan(text: '(90)'),
        ])),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}
