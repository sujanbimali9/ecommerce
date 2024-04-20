import 'package:ecommerce_flutter/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:flutter/material.dart';

class FeaturedBrandCard extends StatelessWidget {
  const FeaturedBrandCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtents: 80,
      itemCount: 4,
      itemBuilder: (context, index) => const TBrandCard(
        brand: 'Nike',
        noOfProducts: '256 Products',
        showBorder: true,
      ),
    );
  }
}
