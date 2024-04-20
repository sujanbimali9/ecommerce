import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConnditions extends StatelessWidget {
  const TermsAndConnditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Checkbox(
            shape: const CircleBorder(), value: false, onChanged: (value) {}),
        Flexible(
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: TTexts.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: ' ${TTexts.privacyPolicy}',
                recognizer: TapGestureRecognizer()..onTap,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline),
              ),
              TextSpan(
                text: ' ${TTexts.and}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap,
                text: '\n${TTexts.termsOfUse}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
