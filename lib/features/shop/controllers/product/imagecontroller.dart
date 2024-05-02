import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  var selectedImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    final Set<String> images = <String>{};
    images.add(product.thumbnail);
    selectedImage.value = product.thumbnail;

    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    if (product.productType == ProductType.variable.toString() &&
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }
    return images.toList();
  }

  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.defaultSpace * 2,
                        horizontal: TSizes.defaultSpace),
                    child: Hero(
                        tag: 'selectedImage',
                        child: CachedNetworkImage(imageUrl: image)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')))
                ],
              ),
            ));
  }
}
