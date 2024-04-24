import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonText: 'change',
          onPressed: () {},
        ),
        Row(
          children: [
            const TRoundedContainer(
                width: 50,
                padding: EdgeInsets.all(TSizes.sm),
                height: 50,
                child: Image(
                  image: AssetImage(TImages.paypal),
                )),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
