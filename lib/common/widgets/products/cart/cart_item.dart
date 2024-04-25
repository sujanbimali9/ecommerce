import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/item_add_remove.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (showAddRemoveButton)
                  TCircularIcon(
                      onPressed: () {},
                      height: 20,
                      width: 20,
                      icon: Icons.check,
                      iconSize: 15,
                      backgroundColor: TColors.primary,
                      color: TColors.white),
                const SizedBox(width: TSizes.spaceBtwItems),
                TRoundedImage(
                  height: 80,
                  image: TImages.productImage14,
                  backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
                ),
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleTextWithVerifyIcon(
                    text: 'Nike',
                    isverified: true,
                  ),
                  const TProductTitleText(
                      text: 'Green Nike Sport Shoe', maxLine: 3),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Color ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.darkGrey)),
                    TextSpan(
                        text: 'Green ',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.darkGrey)),
                    TextSpan(
                        text: 'EU 34 ',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  if (showAddRemoveButton)
                    Row(
                      children: [
                        const TProductQuantityAddRemove(),
                        const Spacer(),
                        Text(
                          '\$50',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  )
                ],
              ),
            ),
          ],
        ),
        if (showAddRemoveButton)
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                splashRadius: 5,
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ))
      ],
    );
  }
}
