import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/custom_tabbar.dart';
import 'package:ecommerce_flutter/common/widgets/cart/cart_icon_button.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/search_bar/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                snap: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
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
                bottom: const TAppTabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Clothes'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ],
                )),
          ],
          body:  TabBarView(children: [
            Padding(
              padding:const EdgeInsets.all(TSizes.spaceBtwItems),
              child: TRoundedContainer(backgroundColor: Colors.transparent,
                padding:const  EdgeInsets.all(TSizes.md),
                showBorder: true,radius: 
                TSizes.cardRadiusLg,
                margin:const  EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                 const TBrandCard(showBorder:  false,),
                  Row(children: [
              Expanded(
                      child: TRoundedContainer(height: 100,radius: TSizes.cardRadiusSm,
                      backgroundColor: dark?TColors.darkGrey:TColors.light,margin: EdgeInsets.all(TSizes.sm),padding:  EdgeInsets.all(TSizes.md),
                        child: Image(image: AssetImage(TImages.productImage10),fit: BoxFit.contain,),
                      ),
                    ),   Expanded(
                      child: TRoundedContainer(height: 100,radius: TSizes.cardRadiusSm,
                      backgroundColor: dark?TColors.darkGrey:TColors.light,margin: EdgeInsets.all(TSizes.sm),padding:  EdgeInsets.all(TSizes.md),
                        child: Image(image: AssetImage(TImages.productImage10),fit: BoxFit.contain,),
                      ),
                    ),   Expanded(
                      child: TRoundedContainer(height: 100,radius: TSizes.cardRadiusSm,
                      backgroundColor: dark?TColors.darkGrey:TColors.light,margin: EdgeInsets.all(TSizes.sm),padding:  EdgeInsets.all(TSizes.md),
                        child: Image(image: AssetImage(TImages.productImage10),fit: BoxFit.contain,),
                      ),
                    ), 
                  ],)

                  ],
                ),
              ),
            ), FeaturedBrandCard(),
                   FeaturedBrandCard(),
                   FeaturedBrandCard(),
                   FeaturedBrandCard(),
          ]),
        ),
      ),
    );
  }
}

class FeaturedBrandCard extends StatelessWidget {
  const FeaturedBrandCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtents: 80,
      itemCount: 4,
      itemBuilder: (context, index) =>const  TBrandCard(),
    );
  }
}

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,  this.showBorder=false,  this.onPressed,
  });

final bool showBorder ;final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(TSizes.sm),
        radius: 10,
        child: Row(
          children: [
            const Flexible(child: TCircularImage(image: TImages.clothIcon)),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleTextWithVerifyIcon(
                    isverified: true,
                    text: 'Nike',
                    brandTextSizes: TextSizes.large,
                  ),
                  Flexible(
                    child: Text(
                      '256 Products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
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

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.isNewtowkImage = false,
    required this.image,
  });
  final bool isNewtowkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Container(
      height: 56,
      width: 56,
      child: Image(
        image: isNewtowkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        color: dark ? TColors.white : TColors.black,
      ),
    );
  }
}
