import 'package:ecommerce_flutter/common/widgets/image_text_widget/brand_title_text.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleTextWithVerifyIcon extends StatelessWidget {
  const TBrandTitleTextWithVerifyIcon({
    super.key,
    required this.text,
    this.isverified = false,
    this.maxLines = 1,
    this.textColor,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String text;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;
  final bool isverified;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TBrandTitleText(
          title: text,
          textAlign: textAlign,
          maxLines: maxLines,
          color: textColor,
          textSizes: brandTextSizes,
        ),
        SizedBox(width: TSizes.sm / 2),
        if (isverified)
          Icon(
            Iconsax.verify5,
            color: iconColor ?? TColors.primary,
            size: TSizes.iconXs,
          )
      ],
    );
  }
}
