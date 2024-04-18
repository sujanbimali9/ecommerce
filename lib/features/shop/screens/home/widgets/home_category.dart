import 'package:ecommerce_flutter/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  final VoidCallback onPressed;

  const THomeCategories({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSectionHeading(
            title: 'Popular Categories',
            showButton: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => VerticalImageText(
                image: TImages.shoeIcon,
                title: '',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
