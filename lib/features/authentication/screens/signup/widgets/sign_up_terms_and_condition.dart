import 'package:ecommerce_flutter/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        Obx(
          () => Checkbox(
              shape: const CircleBorder(),
              value: controller.termsandConditions.value,
              onChanged: (value) => controller.termsandConditions.value =
                  !controller.termsandConditions.value),
        ),
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
                    decorationColor: dark ? TColors.white : TColors.primary,
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
        ),
      ],
    );
  }
}
