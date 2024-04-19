import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_text.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.title,
    required this.price,
    required this.shop,
    this.isverified = false,
  });
  final String title, price, shop;
  final bool isverified;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProductTitleText(text: title, smallText: true),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TBrandTitleTextWithVerifyIcon(text: shop, isverified: isverified),
          Row(
            children: [
              Text(price,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ],
      ),
    );
  }
}
