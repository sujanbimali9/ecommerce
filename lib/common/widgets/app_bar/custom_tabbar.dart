import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TAppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppTabBar({super.key, required this.tabs});

  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          labelColor: dark ? TColors.white : TColors.black,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
