import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/image/cirrcular_image.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/productcontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (product.salePrice > 0)
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm / 2, vertical: TSizes.sm / 3),
                  child: Text(
                    '${productController.salePercentage(product.price, product.salePrice)}%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),
            const SizedBox(width: TSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                product.price.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),
            TProductTitleText(text: productController.getProductPrice(product))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(
          text: product.title,
          smallText: false,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(text: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(productController.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TCircularImage(
              image: product.brand?.image ?? TImages.user,
              isNetworkImage: product.brand?.image != null,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: TBrandTitleTextWithVerifyIcon(
                  isverified: product.brand?.isFeatured ?? false,
                  text: product.brand?.name ?? '',
                  brandTextSizes: TextSizes.medium),
            ),
          ],
        )
      ],
    );
  }
}
