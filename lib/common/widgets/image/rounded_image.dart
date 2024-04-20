import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.imageRadius = TSizes.md,
    this.border,
    this.boxFit,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.onPressed,
  });

  final double? width, height;
  final String image;
  final double imageRadius;
  final BoxBorder? border;
  final BoxFit? boxFit;
  final bool isNetworkImage;
  final bool applyImageRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: applyImageRadius
          ? BorderRadius.all(Radius.circular(imageRadius))
          : BorderRadius.zero,
      child: GestureDetector(
          onTap: onPressed,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            fit: boxFit ?? BoxFit.contain,
          )),
    );
  }
}
