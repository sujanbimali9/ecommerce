import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor, borderColor;
  final double radius;
  final Widget? child;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final bool showBorder;

  const TRoundedContainer(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.backgroundColor,
      this.radius = 0,
      this.margin,
      this.child,
      this.onPressed,
      this.showBorder = false,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          border: showBorder
              ? Border.all(color: borderColor ?? TColors.grey)
              : null,
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: child,
      ),
    );
  }
}
