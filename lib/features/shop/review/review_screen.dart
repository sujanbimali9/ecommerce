import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/products/rating/rating_indicator.dart';
import 'package:ecommerce_flutter/features/shop/review/widgets/overall_rating_indicator.dart';
import 'package:ecommerce_flutter/common/widgets/products/review/user_review_card.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Reviews and Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                  'Ratings and review are all verified and are from people who use the same device that you use'),
              const SizedBox(height: TSizes.spaceBtwItems),
              const OverAllRating(),
              const TRatingIndicator(rating: 4.3),
              Text('12,342', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
