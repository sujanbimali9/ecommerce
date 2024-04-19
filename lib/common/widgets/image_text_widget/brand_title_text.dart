import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    required this.textAlign,
    required this.maxLines,
    required this.color,
    this.textSizes = TextSizes.small,
  });

  final String title;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final TextSizes textSizes;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(title,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines ?? 1,
          style: textSizes == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
              : textSizes == TextSizes.medium
                  ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                  : textSizes == TextSizes.large
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: color)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: color)),
    );
  }
}
