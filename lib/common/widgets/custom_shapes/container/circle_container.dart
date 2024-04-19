import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double radius;
  final Widget? child;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;

  const TCircularContainer(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.backgroundColor,
      this.radius = 0,
      this.margin,
      this.child,
      this.onPressed});
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
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: child,
      ),
    );
  }
}
