import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/products/card/horizontal_product_card.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Sports', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            const TRoundedImage(
              constraints: BoxConstraints(maxHeight: 300),
              image: TImages.promoBanner1,
              isNetworkImage: false,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSectionHeading(
              title: 'Sports Equipment',
              onPressed: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              height: 130,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => const HorizontalProductCard(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
