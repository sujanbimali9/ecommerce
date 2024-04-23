import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class TRatingIndicator extends StatelessWidget {
  const TRatingIndicator({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: 20,
      unratedColor: TColors.grey,
      rating: rating,
      itemBuilder: (context, index) {
        return const Icon(
          Iconsax.star1,
          color: TColors.primary,
        );
      },
    );
  }
}
