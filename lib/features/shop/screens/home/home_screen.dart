import 'package:ecommerce_flutter/common/widgets/product_card/vertical_product_card.dart';
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
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(),
                  THomeCategories(
                    onPressed: () {},
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

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    this.mainAxisExtents,
    required this.itemBuilder,
    required this.itemCount,
    this.crossAxisCount,
  });
  final double? mainAxisExtents;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        mainAxisExtent: mainAxisExtents ?? 310,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
