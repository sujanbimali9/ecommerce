import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.isNetworkImage = false,
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
    this.fit,
    this.overlayColor,
    this.backgroundColor,
    this.padding,
  });
  final Color? backgroundColor;

  final bool isNetworkImage;
  final String image;
  final double? height, width, borderRadius;
  final BoxFit? fit;
  final Color? overlayColor;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50))),
      padding: EdgeInsets.all(padding ?? 8),
      height: height ?? 46,
      width: width ?? 46,
      child: isNetworkImage
          ? CachedNetworkImage(
              fit: fit ?? BoxFit.contain,
              color: overlayColor,
              imageUrl: image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) =>
                  TShimmerEffect(
                    height: height ?? 46,
                    width: width ?? 46,
                  ))
          : Image(
              image: AssetImage(image) as ImageProvider,
              fit: fit ?? BoxFit.contain,
              color: overlayColor,
            ),
    );
  }
}
