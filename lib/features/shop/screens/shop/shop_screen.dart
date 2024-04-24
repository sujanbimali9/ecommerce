import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/custom_tabbar.dart';
import 'package:ecommerce_flutter/common/widgets/brand/featured_brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/cart_icon_button.dart';
import 'package:ecommerce_flutter/common/widgets/search_bar/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/shop/widgets/category_card.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Shop',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCountIcon(
              text: '1',
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                snap: false,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(scrollbars: false),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          showBorder: true,
                          showBackgroundColor: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () {},
                          showButton: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        const FeaturedBrandCard()
                      ],
                    ),
                  ),
                ),
                bottom: const TAppTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                )),
          ],
          body: const TabBarView(
            children: [
              TCategoryTab(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ], brand: 'Nike', noOfProducts: '256 Products'),
              TCategoryTab(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ], brand: 'Ultima', noOfProducts: '10 Products'),
              TCategoryTab(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ], brand: 'GoldStar', noOfProducts: '72 Products'),
              TCategoryTab(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ], brand: 'Xiamoi', noOfProducts: '25 Products'),
              TCategoryTab(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ], brand: 'Samsung', noOfProducts: '470 Products'),
            ],
          ),
        ),
      ),
    );
  }
}
