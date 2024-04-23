import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/curved_edges/curve_edge_widget.dart';
import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCurveEdgeWidget(
      child: Container(
        decoration: BoxDecoration(color: dark ? TColors.dark : TColors.light),
        child: Stack(
          // alignment: Alignment.topCenter,
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage12),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: TSizes.defaultSpace,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 7,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TRoundedImage(
                      borderRadius: 8,
                      border: Border.all(color: TColors.primary),
                      width: 80,
                      image: TImages.productImage2,
                      backgroundColor: dark ? TColors.black : TColors.white),
                ),
              ),
            ),
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  color: Colors.red,
                  icon: Iconsax.heart5,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
