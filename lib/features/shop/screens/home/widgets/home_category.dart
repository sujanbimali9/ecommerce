import 'package:ecommerce_flutter/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  final VoidCallback onPressed;
  final List<String> categories;
  final List<String> title;

  const THomeCategories({
    super.key,
    required this.onPressed,
    required this.categories,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
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
            height: 130,
            child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => VerticalImageText(
                image: categories[index],
                title: title[index],
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
