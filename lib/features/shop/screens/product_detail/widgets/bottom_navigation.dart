import 'package:ecommerce_flutter/common/widgets/products/cart/item_add_remove.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBottomBuyAndAddToCart extends StatelessWidget {
  const TBottomBuyAndAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItems / 2),
      child: Row(
        children: [
          const TProductQuantityAddRemove(),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.xs / 2)),
                  onPressed: () {},
                  child: const Text('Buy'))),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Expanded(
              flex: 3,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.xs / 2)),
                  onPressed: () {},
                  child: const Text('Add to Cart'))),
        ],
      ),
    );
  }
}
