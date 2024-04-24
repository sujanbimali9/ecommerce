import 'package:ecommerce_flutter/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItemBuilder extends StatelessWidget {
  const TCartItemBuilder({
    super.key,
    this.showAddRemoveButton = true,
    this.itemCount = 4,
  });
  final int itemCount;

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const Divider(
              endIndent: TSizes.defaultSpace * 2,
              indent: TSizes.defaultSpace * 2,
            ),
        itemBuilder: (context, index) =>
            CartItem(showAddRemoveButton: showAddRemoveButton));
  }
}
