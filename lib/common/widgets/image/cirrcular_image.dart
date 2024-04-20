import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.isNewtowkImage = false,
    required this.image,
  });
  final bool isNewtowkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 46,
      width: 46,
      child: Image(
        image: isNewtowkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        color: dark ? TColors.white : TColors.black,
      ),
    );
  }
}
