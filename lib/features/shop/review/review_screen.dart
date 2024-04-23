import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Reviews and Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Flexible(
                child: Text(
                    'Ratings and review are all verified and are from people who use the same device that you use'),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Row(
                children: [
                  Text(
                    '4.7',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .apply(fontSizeFactor: 5),
                  ),
                  Expanded(
                      child: RatingBar(
                          ratingWidget: RatingWidget(
                              full: Container(
                                color: TColors.grey,
                              ),
                              half: Container(),
                              empty: Container(
                                color: TColors.white,
                              )),
                          onRatingUpdate: (value) {}))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
