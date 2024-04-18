import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/home_category.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/primary_header.dart';
import 'package:ecommerce_flutter/common/widgets/search_bar/search_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(),
                  THomeCategories(onPressed: () {}),
                  const SizedBox(
                    height: 500,
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 500),
              child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, t) => TRoundedImage(
                        image: TImages.promoBanner1,
                        onPressed: () {},
                      ),
                  options: CarouselOptions(
                    // autoPlay: true,
                    viewportFraction: 1,
                  )),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SmoothPageIndicator(
              controller: PageController(),
              count: 3,
              effect: const SlideEffect(
                  activeDotColor: TColors.primary, dotColor: TColors.grey),
            )
          ],
        ),
      ),
    );
  }
}
