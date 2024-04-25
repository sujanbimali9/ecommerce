import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/features/shop/controllers/homecontroller.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.promo});
  final List<String> promo;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController.instance;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(TSizes.md),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: CarouselSlider.builder(
                carouselController: controller.carouselController,
                itemCount: promo.length,
                itemBuilder: (context, index, t) => TRoundedImage(
                      width: double.infinity,
                      image: promo[index],
                      boxFit: BoxFit.cover,
                    ),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      controller.updateCurrentIndex(index),
                  viewportFraction: 1,
                )),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TSliderIndicator(promo: promo, controller: controller)
      ],
    );
  }
}

class TSliderIndicator extends StatelessWidget {
  const TSliderIndicator({
    super.key,
    required this.promo,
    required this.controller,
  });

  final List<String> promo;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
          promo.length,
          (index) => Obx(
                () => GestureDetector(
                  onTap: () => controller.onDotClick(index),
                  child: TRoundedContainer(
                    height: controller.currentIndex.value == index ? 4 : 3,
                    width: controller.currentIndex.value == index ? 20 : 10,
                    radius: 10,
                    backgroundColor: controller.currentIndex.value == index
                        ? TColors.primary
                        : TColors.grey,
                    margin: const EdgeInsets.only(left: 5),
                  ),
                ),
              )),
    );
  }
}
