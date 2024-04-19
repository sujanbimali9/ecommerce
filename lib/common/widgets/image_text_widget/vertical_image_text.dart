import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    required this.image,
    required this.title,
    required this.onPressed,
  });
  final Color? textColor, backgroundColor;
  final String image, title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? TColors.black : TColors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(28))),
              child: Center(
                  child: Image.asset(
                image,
                fit: BoxFit.cover,
                color: TColors.dark,
              )),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                      color:
                          textColor ?? (dark ? TColors.light : TColors.dark)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
