import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConnditions extends StatelessWidget {
  const TermsAndConnditions({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            shape: const CircleBorder(), value: false, onChanged: (value) {}),
        RichText(
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
              text: ' ${TTexts.termsOfUse}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline),
            ),
          ],
        )),
      ],
    );
  }
}
