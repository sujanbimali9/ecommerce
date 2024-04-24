import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    this.isSelected = false,
    super.key,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      child: TRoundedContainer(
        width: double.infinity,
        radius: TSizes.cardRadiusMd,
        showBorder: true,
        backgroundColor:
            isSelected ? TColors.primary.withOpacity(0.4) : Colors.transparent,
        borderColor: isSelected
            ? Colors.transparent
            : dark
                ? TColors.darkerGrey
                : TColors.grey,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sujan Bimali',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(right: 9.0),
                  child: Icon(
                    isSelected ? Iconsax.tick_circle5 : null,
                    color: dark ? TColors.light : TColors.dark.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.sm / 2),
            const Text(
              '+977-9749223210',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: TSizes.sm / 2),
            const Text(
              'Kamal Rural Municipality, Jhapa, Nepal',
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
