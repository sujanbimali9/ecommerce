import 'package:ecommerce_flutter/common/widgets/brand/brand_showcase.dart';
import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/product_card/vertical_product_card.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.images,
    required this.brand,
    required this.noOfProducts,
  });

  final List<String> images;
  final String brand, noOfProducts;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              children: [
                TBrandShowCase(
                  brand: brand,
                  images: images,
                  noOfProducts: noOfProducts,
                ),
                TSectionHeading(
                  title: 'You might like',
                  showButton: true,
                  onPressed: () {},
                ),
                TGridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) => const TVerticalProductCard(
                      discountPercentage: '23%', image: TImages.productImage34),
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections)
        ]);
  }
}
