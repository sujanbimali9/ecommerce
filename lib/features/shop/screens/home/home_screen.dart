import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/card/vertical_product_card.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/controllers/productcontroller.dart';
import 'package:ecommerce_flutter/features/shop/screens/subcategory/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_flutter/common/widgets/search_bar/search_container.dart';
import 'package:ecommerce_flutter/features/shop/controllers/homecontroller.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/home_category.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/primary_header.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final productController = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TSizes.md, vertical: TSizes.xs),
                    child: TSearchContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showButton: false,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        THomeCategories(
                          onPressed: () =>
                              Get.to(() => const SubCategoryScreen()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.iconXs),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Obx(() => productController.isLoading.value
                      ? const TVerticalProductShimmerEffect()
                      : TGridLayout(
                          itemCount: productController.featuredProducts.length,
                          itemBuilder: (context, index) => TVerticalProductCard(
                              product:
                                  productController.featuredProducts[index]),
                        )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
