import 'package:ecommerce_flutter/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            text: 'Price:',
                            smallText: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const TProductTitleText(text: '\$20'),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                              text: 'Status:  ', smallText: true),
                          // const SizedBox(width: TSizes.spaceBtwItems),
                          Text('In Stock',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(color: Colors.green)),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const TProductTitleText(
                  text:
                      'This is the description of variation of products and it can go upto 4 lines',
                  maxLine: 4,
                  smallText: true)
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Color', showButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TChoiceChip(
                  isSelected: true,
                  text: 'Green',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  isSelected: false,
                  text: 'Yellow',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  isSelected: false,
                  text: 'Red',
                  onSelected: (value) {},
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const TSectionHeading(title: 'Size', showButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TChoiceChip(
                  isSelected: true,
                  text: 'EU 34',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  isSelected: false,
                  text: 'EU 36',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  isSelected: false,
                  text: 'EU 38',
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
