import 'package:ecommerce_flutter/features/shop/controllers/product/imagecontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_varitaiton_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttribute = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty.obs;

  String getProductStockStatus() {
    return variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'Out of Stock' : 'In Stock';
  }

  void onAttributeSelected(
      ProductModel product, String attrubuteName, String attrubuteValue) {
    final selectedAttribute = Map<String, dynamic>.from(this.selectedAttribute);
    selectedAttribute[attrubuteName] = attrubuteValue;
    this.selectedAttribute[attrubuteName] = attrubuteValue;
    final selectedVariation = product.productVariations!.firstWhere(
        (varitaion) =>
            _isSameAttribute(varitaion.attributesValues, selectedAttribute),
        orElse: () => ProductVariationModel.empty);
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedImage.value = selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
  }

  bool _isSameAttribute(Map<String, dynamic> variationAttribute,
      Map<String, dynamic> selectedAttribute) {
    if (variationAttribute.length != selectedAttribute.length) return false;
    for (final key in variationAttribute.keys) {
      if (variationAttribute[key] != selectedAttribute[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((varitaion) =>
            varitaion.attributesValues[attributeName] != null &&
            (varitaion.attributesValues[attributeName]! as String).isNotEmpty &&
            varitaion.stock > 0)
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();
    return availableVariationAttributeValues.cast<String?>();
  }

  String get variationPrice => selectedVariation.value.salePrice > 0
      ? selectedVariation.value.salePrice.toString()
      : selectedVariation.value.price.toString();

  void resetSelectedAttribute() {
    selectedAttribute.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty;
  }
}
