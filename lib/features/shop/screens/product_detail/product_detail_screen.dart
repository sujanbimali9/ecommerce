import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/review/review_screen.dart';
import 'package:ecommerce_flutter/common/widgets/products/review/user_review_card.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/bottom_navigation.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/product_attribute.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/product_image_slider.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/produt_meta_data.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomBuyAndAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  TRatingAndShare(product: product),
                  TProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  if (product.productType == ProductType.variable.toString())
                    TProductAttribute(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                      title: 'Description', showButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimCollapsedText: 'Show more',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews(199)', showButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            color: dark ? TColors.white : TColors.black,
                          ))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TUserReviewCard(),
                  const TUserReviewCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
