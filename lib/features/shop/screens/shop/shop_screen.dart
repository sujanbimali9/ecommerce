import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/custom_tabbar.dart';
import 'package:ecommerce_flutter/common/widgets/brand/featured_brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/cart_icon_button.dart';
import 'package:ecommerce_flutter/common/widgets/search_bar/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/controllers/categorycontroller.dart';
import 'package:ecommerce_flutter/features/shop/screens/allbrands/all_brand_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/shop/widgets/category_card.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            TCartCountIcon(
              text: '1',
            )
          ],
        ),
        body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              excludeHeaderSemantics: true,
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              snap: false,
              backgroundColor: dark ? TColors.black : TColors.white,
              expandedHeight: 400,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(scrollbars: false),
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
                        onPressed: () => Get.to(() => const AllBrandScreen()),
                        showButton: true,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      const FeaturedBrandCard()
                    ],
                  ),
                ),
              ),
              bottom: TAppTabBar(
                tabs: categories
                    .map((category) => Tab(child: Text(category.name)))
                    .toList(),
              ),
            ),
          ],
          body: TabBarView(
            children: categories
                .map(
                  (category) => TCategoryTab(category: category),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
