import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalProductShimmerEffect extends StatelessWidget {
  const TVerticalProductShimmerEffect({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemBuilder: (context, index) => const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(height: 180, width: 180, radius: 10),
                SizedBox(height: TSizes.spaceBtwItems),
                TShimmerEffect(height: 15, width: 160, radius: 10),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                TShimmerEffect(height: 15, width: 110, radius: 10)
              ],
            )),
        itemCount: itemCount);
  }
}
