import 'dart:developer';

import 'package:ecommerce_flutter/common/style/box_shadow.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:ecommerce_flutter/common/widgets/image/product_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/productcontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TVerticalProductCard extends StatelessWidget {
  const TVerticalProductCard({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.icon,
    this.iconColor,
    required this.product,
  });

  final double? height, width, padding;
  final IconData? icon;
  final Color? iconColor;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    log(productController.getProductPrice(product));
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductCardShadow],
            borderRadius: const BorderRadius.all(
                Radius.circular(TSizes.productImageRadius)),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          children: [
            TProductImage(
              image: product.thumbnail,
              discoutPercentage: productController.salePercentage(
                  product.price, product.salePrice),
              height: height ?? 160,
              icon: icon,
              iconColor: iconColor,
              isNetworkImage: true,
              onIconPressed: () {},
              padding: padding,
              width: width,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(text: product.title, smallText: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 3),
                  TBrandTitleTextWithVerifyIcon(
                      text: product.brand!.name, isverified: true),
                  Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Text('\$${product.price}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: TColors.darkerGrey,
                                    decoration: TextDecoration.lineThrough)),
                      Text(productController.getProductPrice(product),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 3, right: 3, bottom: 4, top: 2),
              child: AddToCartButton(
                onPressed: () {},
                width: double.infinity,
                borderRadius: TSizes.productImageRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
