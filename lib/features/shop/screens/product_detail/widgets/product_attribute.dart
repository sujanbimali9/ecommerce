import 'package:ecommerce_flutter/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/variationcontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(
      children: [
        if (controller.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            radius: TSizes.cardRadiusLg,
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const TSectionHeading(
                      title: 'Variation',
                      showButton: false,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const TProductTitleText(
                                  text: 'Price:',
                                  smallText: true,
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    controller.selectedVariation.value.price
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                TProductTitleText(
                                    text: controller.variationPrice),
                              ],
                            ),
                            Row(
                              children: [
                                const TProductTitleText(
                                    text: 'Status:  ', smallText: true),
                                Text(controller.variationStockStatus.value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(color: Colors.green)),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                Obx(() => TProductTitleText(
                    text: controller.selectedVariation.value.description ?? '',
                    maxLine: 4,
                    smallText: true))
              ],
            ),
          ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                            title: attribute.name ?? '', showButton: false),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(() => Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: attribute.values!.map(
                                (value) {
                                  final isSelected = controller
                                          .selectedAttribute[attribute.name] ==
                                      value;
                                  final available = controller
                                      .getAttributesAvailabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(value);
                                  return TChoiceChip(
                                    isSelected: isSelected,
                                    text: value,
                                    onSelected: available
                                        ? (selected) {
                                            if (available && selected) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  value);
                                            }
                                          }
                                        : null,
                                  );
                                },
                              ).toList(),
                            )),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                      ],
                    ))
                .toList()),
      ],
    );
  }
}
