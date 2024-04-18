import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.padding,
    required this.backgroundColor,
    required this.radius,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final double padding;
  final Color backgroundColor;
  final double radius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}
