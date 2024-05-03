import 'package:ecommerce_flutter/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/categoryshimmer.dart';
import 'package:ecommerce_flutter/features/shop/controllers/categorycontroller.dart';
import 'package:ecommerce_flutter/features/shop/screens/subcategory/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  final VoidCallback onPressed;

  const THomeCategories({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TCategoryShimmerEffect();
      } else {
        return SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: controller.featuredCategories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = controller.featuredCategories[index];
              return VerticalImageText(
                image: category.image,
                title: category.name,
                onPressed: () => Get.to(() => const SubCategoryScreen()),
              );
            },
          ),
        );
      }
    });
  }
}
