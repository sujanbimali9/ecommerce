import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/card/vertical_product_card.dart';
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
                  THomeCategories(
                    onPressed: () => Get.to(() => const SubCategoryScreen()),
                    title: const [
                      'shoeIcon',
                      'electronicsIcon',
                      'clothIcon',
                      'cosmeticsIcon',
                      'animalIcon',
                      'toyIcon',
                      'furnitureIcon',
                      'jeweleryIcon'
                    ],
                    categories: const [
                      TImages.shoeIcon,
                      TImages.electronicsIcon,
                      TImages.clothIcon,
                      TImages.cosmeticsIcon,
                      TImages.animalIcon,
                      TImages.toyIcon,
                      TImages.furnitureIcon,
                      TImages.jeweleryIcon,
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.iconXs),
              child: Column(
                children: [
                  const TPromoSlider(
                    promo: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TGridLayout(
                    itemCount: 10,
                    itemBuilder: (context, index) => const TVerticalProductCard(
                      width: double.infinity,
                      image: TImages.productImage1,
                      discountPercentage: '20%',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
