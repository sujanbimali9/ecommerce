import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.borderRadius = TSizes.productImageRadius,
    this.border,
    this.boxFit,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.onPressed,
    this.backgroundColor,
    this.constraints,
  });

  final BoxConstraints? constraints;
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
        constraints: constraints,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.all(Radius.circular(borderRadius))
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: boxFit ?? BoxFit.contain,
                  imageUrl: image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, progress) =>
                      TShimmerEffect(
                        height: height ?? 46,
                        width: width ?? 46,
                        radius: borderRadius,
                      ))
              : Image(
                  image: AssetImage(image) as ImageProvider,
                  fit: boxFit ?? BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
