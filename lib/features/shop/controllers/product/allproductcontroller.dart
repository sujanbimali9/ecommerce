import 'package:ecommerce_flutter/data/repositories/product/product_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final RxList<ProductModel> filteredproduct = <ProductModel>[].obs;

  void sortProduct(String? filter) {
    if (filter != null) {
      switch (filter) {
        case 'Name':
          filteredproduct.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'Higher Price':
          filteredproduct.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Lower Price':
          filteredproduct.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Sale':
          filteredproduct.sort((a, b) {
            if (b.salePrice > 0) {
              return a.salePrice.compareTo(b.salePrice);
            } else if (a.salePrice > 0) {
              return -1;
            } else {
              return 1;
            }
          });
          break;
        case 'Newest':
          filteredproduct.sort((a, b) => a.date!.compareTo(b.date!));
          break;
        case 'Date':
          filteredproduct.sort((a, b) {
            if (a.date != null && b.date != null) {
              return a.date!.compareTo(b.date!);
            }
            if (a.date == null) return 1;
            if (b.date == null) return -1;
            return 0;
          });
          break;
        case 'Popularity':
          filteredproduct.sort((a, b) => a.isFeatured ?? false ? 1 : -1);
          break;
        default:
          filteredproduct.sort((a, b) => a.title.compareTo(b.title));
          break;
      }
    }
  }

  final repository = ProductRepository.instance;

  Future<List<ProductModel>>? fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.getProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
      return [];
    }
  }
}
