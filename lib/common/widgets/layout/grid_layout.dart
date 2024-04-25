import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    this.mainAxisExtents,
    required this.itemBuilder,
    required this.itemCount,
    this.crossAxisCount,
    this.isScrollable = false,
  });
  final double? mainAxisExtents;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final bool isScrollable;
  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        mainAxisExtent: mainAxisExtents ?? 298,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
