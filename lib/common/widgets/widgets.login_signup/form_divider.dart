import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(
            child: Divider(
          color: dark ? TColors.grey : TColors.darkGrey,
          indent: 60,
          endIndent: 5,
          thickness: 0.5,
        )),
        Text(
          dividerText.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
          child: Divider(
            color: dark ? TColors.grey : TColors.darkGrey,
            indent: 5,
            endIndent: 60,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
