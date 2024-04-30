import 'package:ecommerce_flutter/data/repositories/category/category_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;

  final _categoryRepositoy = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepositoy.getAllCategory();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(categories.where(
          (category) => category.isFeatured && category.parentId.isNotEmpty));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
