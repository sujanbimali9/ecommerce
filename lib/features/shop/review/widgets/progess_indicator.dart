import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.ratingValue,
  });

  final String text;
  final double ratingValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
            flex: 15,
            child: LinearProgressIndicator(
              value: ratingValue,
              backgroundColor: TColors.grey,
              color: TColors.primary,
              minHeight: 10,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              borderRadius:
                  const BorderRadius.all(Radius.circular(TSizes.cardRadiusSm)),
            ))
      ],
    );
  }
}
