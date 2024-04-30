import 'package:ecommerce_flutter/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmerEffect extends StatelessWidget {
  const TCategoryShimmerEffect({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Column(
                children: [
                  TShimmerEffect(height: 56, width: 56, radius: 28),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TShimmerEffect(height: 8, width: 56)
                ],
              )),
    );
  }
}
