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
  });
  final Color? backgroundColor;

  final bool isNetworkImage;
  final String image;
  final double? height, width, borderRadius;
  final BoxFit? fit;
  final Color? overlayColor;
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50))),
      height: height ?? 46,
      width: width ?? 46,
      child: Image(
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        fit: fit ?? BoxFit.contain,
        color: overlayColor,
      ),
    );
  }
}
