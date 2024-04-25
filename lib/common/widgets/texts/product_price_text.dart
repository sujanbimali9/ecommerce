import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText(
      {super.key,
      required this.price,
      this.currencySign = '\$',
      this.isLarge = false,
      this.lineThrough = false,
      this.maxLines = 1});
  final String price, currencySign;
  final bool isLarge, lineThrough;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text('$currencySign$price',
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
