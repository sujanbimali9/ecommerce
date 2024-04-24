import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponsCode extends StatelessWidget {
  const TCouponsCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Have a Promo code? Enter here',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(80, 70),
                    minimumSize: Size(80, 50),
                    foregroundColor: dark
                        ? TColors.white.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),
                    backgroundColor: TColors.grey.withOpacity(0.2),
                    side: BorderSide(color: TColors.grey.withOpacity(0.1))),
                onPressed: () {},
                child: const Text('Apply')),
          )),
    );
  }
}
