import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/features/shop/controllers/bannercontroller.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TSliderIndicator extends StatelessWidget {
  const TSliderIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannercontroller = BannerController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
          bannercontroller.allBanners.length,
          (index) => GestureDetector(
                onTap: () => bannercontroller.onDotClick(index),
                child: Obx(
                  () => TRoundedContainer(
                    height:
                        bannercontroller.currentIndex.value == index ? 4 : 3,
                    width:
                        bannercontroller.currentIndex.value == index ? 20 : 10,
                    radius: 10,
                    backgroundColor:
                        bannercontroller.currentIndex.value == index
                            ? TColors.primary
                            : TColors.grey,
                    margin: const EdgeInsets.only(left: 5),
                  ),
                ),
              )),
    );
  }
}
