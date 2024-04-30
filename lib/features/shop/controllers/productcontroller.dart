import 'package:ecommerce_flutter/data/repositories/product/product_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
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

  void fetchFeaturedProducts() async {
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
}
