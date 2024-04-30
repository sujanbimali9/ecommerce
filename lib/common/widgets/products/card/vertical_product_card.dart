import 'package:ecommerce_flutter/common/style/box_shadow.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:ecommerce_flutter/common/widgets/image/product_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/produt_title_price.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              discoutPercentage: '40%',
              height: height ?? 160,
              icon: icon,
              iconColor: iconColor,
              isNetworkImage: true,
              onIconPressed: () {},
              padding: padding,
              width: width,
            ),
            const Spacer(),
            /*   ProductTitleAndPrice(
              title: product.title,
              price: product.salePrice,
              shop: product.brand!.name,
              isverified: true,
            ),*/
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
