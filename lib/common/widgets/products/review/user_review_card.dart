import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/products/rating/rating_indicator.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
                backgroundImage: AssetImage(TImages.userProfileImage1)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Raj',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const Row(
          children: [
            TRatingIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('01 Nov,2023')
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const ReadMoreText(
          'The user interface of the app is quite intutive. I was able to navigate and purchase seamlessly. Great job!',
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          radius: TSizes.borderRadiusLg,
          child: Column(
            children: [
              Row(
                children: [
                  Text('T\'s Store',
                      style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  Text('02 Nov,2023',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const ReadMoreText(
                'The user interface of the app is quite intutive. I was able to navigate and purchase seamlessly. Great job!',
                trimLines: 2,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems)
      ],
    );
  }
}
