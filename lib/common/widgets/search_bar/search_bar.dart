import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TAppSearchBar extends StatelessWidget {
  const TAppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.search_favorite),
              fillColor: TColors.white,
              filled: true,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              hintText: 'Search in Store',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.darkGrey, fontSizeDelta: 1)),
        ));
  }
}
