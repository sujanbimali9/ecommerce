import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwItems),
        itemCount: 5,
        itemBuilder: (context, index) {
          return TRoundedContainer(
            radius: TSizes.cardRadiusLg,
            showBorder: true,
            backgroundColor: dark ? TColors.dark : TColors.light,
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text('07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(Iconsax.arrow_right_34, size: TSizes.lg))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Iconsax.tag),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text('[#1223333]',
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('10 Nov 2024',
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
