import 'package:ecommerce_flutter/features/shop/screens/review/widgets/progess_indicator.dart';
import 'package:flutter/material.dart';

class OverAllRating extends StatelessWidget {
  const OverAllRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child:
                Text('4.7', style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              ...List<Widget>.generate(
                  5,
                  (index) => RatingProgressIndicator(
                        text: (5 - index).toString(),
                        ratingValue: 1 - index / 10,
                      )).toList()
            ],
          ),
        )
      ],
    );
  }
}
