import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/bottom_navigation.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/product_attribute.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/product_image_slider.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/produt_meta_data.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomBuyAndAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TRatingAndShare(),
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TProductAttribute(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                      title: 'Description', showButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    '''Introducing the Nike Air Zoom Pegasus 38, where legendary comfort meets unmatched performance. Engineered for runners who demand excellence, this dynamic shoe boasts a sleek design fused with cutting-edge technology.

Crafted with a breathable mesh upper, the Air Zoom Pegasus 38 ensures optimal airflow, keeping your feet cool and comfortable mile after mile. The innovative Zoom Air unit in the forefoot delivers responsive cushioning with every stride, providing a spring-like sensation that propels you forward.

Designed for versatility, the Pegasus 38 features a durable rubber outsole with a waffle pattern for superior traction on various surfaces, whether you're pounding the pavement or hitting the trails. Plus, the padded collar and secure lace-up closure offer a snug, supportive fit that locks your foot in place for a distraction-free run.

From daily training sessions to race day excitement, the Nike Air Zoom Pegasus 38 is your go-to shoe for conquering any distance with confidence and style.''',
                    trimLines: 2,
                    trimCollapsedText: 'Show more',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            color: dark ? TColors.white : TColors.black,
                          ))
                    ],
                  )
                  // Ratings(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
