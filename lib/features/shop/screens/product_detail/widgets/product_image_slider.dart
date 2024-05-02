import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/curved_edges/curve_edge_widget.dart';
import 'package:ecommerce_flutter/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/imagecontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final imageController = Get.put(ImageController());
    final images = imageController.getAllProductImages(product);

    return TCurveEdgeWidget(
      child: Container(
        decoration: BoxDecoration(color: dark ? TColors.dark : TColors.light),
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Obx(() => GestureDetector(
                          onTap: () => imageController.showEnlargeImage(
                              imageController.selectedImage.value),
                          child: CachedNetworkImage(
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(
                              value: progress.progress,
                              color: TColors.primary,
                            ),
                            imageUrl: imageController.selectedImage.value,
                          ),
                        ))),
              ),
            ),
            Positioned(
              bottom: 30,
              left: TSizes.defaultSpace,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(() => TRoundedImage(
                        onPressed: () =>
                            imageController.selectedImage.value = images[index],
                        borderRadius: 8,
                        border:
                            imageController.selectedImage.value == images[index]
                                ? Border.all(color: TColors.primary)
                                : null,
                        width: 80,
                        image: images[index],
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.black : TColors.white));
                  },
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
