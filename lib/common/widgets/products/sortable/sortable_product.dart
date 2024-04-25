import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/card/vertical_product_card.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            borderRadius:
                const BorderRadius.all(Radius.circular(TSizes.cardRadiusLg)),
            value: 'Name',
            autofocus: false,
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((text) => DropdownMenuItem(
                      value: text,
                      child: Text(text),
                    ))
                .toList(),
            onChanged: (value) {}),
        const SizedBox(height: TSizes.spaceBtwSections),
        TGridLayout(
            itemBuilder: (BuildContext context, int index) =>
                const TVerticalProductCard(image: TImages.productImage29),
            itemCount: 9)
      ],
    );
  }
}
