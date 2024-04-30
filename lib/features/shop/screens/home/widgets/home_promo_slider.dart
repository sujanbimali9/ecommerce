import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce_flutter/features/shop/controllers/bannercontroller.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/promo_slider_indicator.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(TSizes.md),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Obx(() {
              return bannerController.isLoading.value
                  ? const TShimmerEffect(height: 200, width: double.infinity)
                  : CarouselSlider.builder(
                      carouselController: bannerController.carouselController,
                      itemCount: bannerController.allBanners.length,
                      itemBuilder: (context, index, t) => TRoundedImage(
                            onPressed: () => Get.toNamed(bannerController
                                .allBanners[index].targetScreen),
                            isNetworkImage: true,
                            width: double.infinity,
                            image: bannerController.allBanners[index].imageUrl,
                            boxFit: BoxFit.cover,
                          ),
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) =>
                            bannerController.updateCurrentIndex(index),
                        viewportFraction: 1,
                      ));
            }),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const TSliderIndicator()
      ],
    );
  }
}
