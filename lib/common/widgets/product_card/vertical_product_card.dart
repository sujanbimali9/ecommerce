import 'package:ecommerce_flutter/common/style/box_shadow.dart';
import 'package:ecommerce_flutter/common/widgets/cart/add_to_cart_button.dart';
import 'package:ecommerce_flutter/common/widgets/image/product_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/produt_title_price.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalProductCard extends StatelessWidget {
  const TVerticalProductCard(
      {super.key,
      required this.image,
      this.isNetworkImage,
      this.discountPercentage,
      this.height,
      this.width,
      this.padding,
      this.icon,
      this.iconColor,
      this.onIconPressed});

  final String image;
  final bool? isNetworkImage;
  final String? discountPercentage;
  final double? height, width, padding;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductCardShadow],
          borderRadius: const BorderRadius.all(
              Radius.circular(TSizes.productImageRadius)),
          color: dark ? TColors.darkerGrey : TColors.white),
      child: Column(
        children: [
          TProductImage(
            image: TImages.productImage1,
            discoutPercentage: discountPercentage,
            height: height,
            icon: icon,
            iconColor: iconColor,
            isNetworkImage: isNetworkImage,
            onIconPressed: onIconPressed,
            padding: padding,
            width: width,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),
          const ProductTitleAndPrice(
            title: 'Green Nike Air Shoe',
            price: '35',
            shop: 'Nike',
            isverified: true,
          ),
          const AddToCartButton(
            width: 150,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          )
        ],
      ),
    );
  }
}
