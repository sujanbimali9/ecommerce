import 'package:ecommerce_flutter/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
    required this.noOfProducts,
  });
  final List<String> images;
  final String brand;
  final String noOfProducts;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      radius: TSizes.cardRadiusLg,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TBrandCard(
            brand: brand,
            noOfProducts: noOfProducts,
            showBorder: false,
          ),
          Row(
              children: images
                  .map<Widget>((e) => brandTopProuctImageWidget(e, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProuctImageWidget(String image, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: TRoundedContainer(
        height: 100,
        radius: TSizes.cardRadiusSm,
        backgroundColor: dark ? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(left: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
