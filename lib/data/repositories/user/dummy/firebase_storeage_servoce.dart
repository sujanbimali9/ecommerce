import 'dart:async';
import 'dart:typed_data';

import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxController {
  static FirebaseStorageService get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<Uint8List> getDataFromAssets(String location) async {
    try {
      final data = await rootBundle.load(location);
      final imageData =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      return imageData;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> uploadImages(Uint8List file, String id, String path) async {
    final name = path.split('/').last;
    final ref = _storage.ref('id').child(name);
    await ref.putData(
        file, SettableMetadata(contentType: name.split('.').last));
    return await ref.getDownloadURL();
  }

  Future<void> uploadCategory(List<CategoryModel> categories) async {
    try {
      for (final category in categories) {
        final file = await getDataFromAssets(category.image);
        final url = await uploadImages(
            file, 'categories/${category.id}', category.image);
        category.image = url;
        await _db.collection('categories').add(category.toJson());
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (int i = 0; i < products.length; i++) {
        final product = products[i];
        if (product.productType == ProductType.variable.toString() &&
            product.productVariations != null) {
          for (int j = 0; j < product.productVariations!.length; j++) {
            final varient = product.productVariations![j];

            final file = await getDataFromAssets(varient.image);
            final url = await uploadImages(file,
                'products/${product.id}/varient/${varient.id}', varient.image);
            products[i].productVariations![j].image = url;
          }
        }
        final thumnailFile = await getDataFromAssets(product.thumbnail);
        final url = await uploadImages(
            thumnailFile, 'products/${product.id}/thumnail', product.thumbnail);
        products[i].thumbnail = url;
        if (product.images != null && product.images!.isNotEmpty) {
          for (int k = 0; k < product.images!.length; k++) {
            final image = product.images![k];
            final imageFile = await getDataFromAssets(image);
            final imageUrl = await uploadImages(
                imageFile, 'products/${product.id}/images', image);
            products[i].images![k] = imageUrl;
          }
        }

        await _db.collection('categories').add(products[i].toJson());
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
