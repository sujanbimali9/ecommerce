import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/image/cirrcular_image.dart';
import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text_with_verifyicon.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = false,
    this.onPressed,
    required this.brand,
    required this.noOfProducts,
  });

  final bool showBorder;
  final VoidCallback? onPressed;
  final String brand, noOfProducts;

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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TBrandTitleTextWithVerifyIcon(
                    isverified: true,
                    text: brand,
                    brandTextSizes: TextSizes.large,
                  ),
                  Flexible(
                    child: Text(
                      noOfProducts,
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
