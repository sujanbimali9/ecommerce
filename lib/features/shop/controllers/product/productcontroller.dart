import 'package:ecommerce_flutter/data/repositories/product/product_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_varitaiton_model.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final RxBool isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final _productRepositoy = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepositoy.getFeaturedProducts();
      featuredProducts.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = 0;
    double largestPrice = 0;
    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    } else {
      for (ProductVariationModel variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  String? salePercentage(double originalPrice, double? salePrice) {
    if (salePrice != null || salePrice! <= 0.0) return null;

    if (originalPrice <= 0) return null;
    return (((originalPrice - salePrice) / originalPrice) * 100)
        .toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock <= 0 ? 'Out of Stock' : 'In Stock';
  }
}
