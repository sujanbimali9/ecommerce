import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/card/vertical_product_card.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/allproductcontroller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AllProductController.instance;
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
          onChanged: controller.sortProduct,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(() => TGridLayout(
            itemBuilder: (BuildContext context, int index) =>
                TVerticalProductCard(
                    product: controller.filteredproduct[index]),
            itemCount: controller.filteredproduct.length))
      ],
    );
  }
}
