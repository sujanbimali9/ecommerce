import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.borderRadius = TSizes.md,
    this.border,
    this.boxFit,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.onPressed,
    this.backgroundColor,
  });

  final double? width, height;
  final String image;
  final double borderRadius;
  final BoxBorder? border;
  final BoxFit? boxFit;
  final bool isNetworkImage;
  final bool applyImageRadius;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.all(Radius.circular(borderRadius))
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            fit: boxFit ?? BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
