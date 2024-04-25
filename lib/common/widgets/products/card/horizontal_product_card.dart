import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/add_to_favourite_button.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      height: 120,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.all(
              Radius.circular(TSizes.productImageRadius))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              TRoundedImage(
                height: 120,
                width: 120,
                // borderRadius: TSizes.productImageRadius - 2,
                backgroundColor:
                    dark ? TColors.dark.withOpacity(0.5) : TColors.white,
                image: TImages.productImage1,
              ),
              const Positioned(
                  right: 4,
                  top: 4,
                  child: TAddToFavouriteButton(
                    height: 30,
                    width: 30,
                  )),
              Positioned(
                top: 4,
                left: 4,
                child: TRoundedContainer(
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  radius: TSizes.borderRadiusLg,
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text(
                    '50%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: TSizes.sm, left: TSizes.sm, right: TSizes.sm, bottom: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TProductTitleText(
                      smallText: true,
                      text: 'ssjhdljhsldj hdj sdhljdsh ds ',
                      maxLine: 2),
                  SizedBox(height: TSizes.spaceBtwItems / 3),
                  TBrandTitleTextWithVerifyIcon(
                      text: 'Adidas', isverified: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TProductPriceText(price: '20'),
                      Spacer(),
                      AddToCartButton(),
                      SizedBox(width: TSizes.spaceBtwItems / 2),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
