import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ShippingAddressSelection extends StatelessWidget {
  const ShippingAddressSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttonText: 'change', onPressed: () {}),
        Text('Sujan Bimali', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(
              Iconsax.call,
              size: 16,
              color: TColors.grey,
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              '+977-9749223210',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(
              Iconsax.location,
              size: 16,
              color: TColors.grey,
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              'Kamal Rural Municipality,Jhapa, Nepal',
              softWrap: true,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ],
    );
  }
}
