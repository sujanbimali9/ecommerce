import 'dart:async';
import 'package:ecommerce_flutter/features/shop/models/banner_model.dart';
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
    final ref = _storage.ref(id).child(name);
    try {
      return await ref.getDownloadURL();
    } catch (e) {
      await ref.putData(
          file, SettableMetadata(contentType: name.split('.').last));
      return await ref.getDownloadURL();
    }
  }

  Future<void> uploadBanner(List<BannerModel> banners) async {
    try {
      final List<Future<void>> uploadTask = [];
      for (final banner in banners) {
        final file = await getDataFromAssets(banner.imageUrl);
        final url = await uploadImages(file, 'Banners', banner.imageUrl);
        banner.imageUrl = url;
        final upload = _db.collection('Banners').doc().set(banner.toJson());
        uploadTask.add(upload);
      }
      Future.wait(uploadTask);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadCategory(List<CategoryModel> categories) async {
    try {
      List<Future<void>> uploadTasks = [];

      for (final category in categories) {
        final file = await getDataFromAssets(category.image);
        final url =
            await uploadImages(file, 'Categories/images', category.image);
        category.image = url;
        final uploadTask = _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
        uploadTasks.add(uploadTask);
      }
      await Future.wait(uploadTasks);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (final product in products) {
        if (product.productType == ProductType.variable.toString() &&
            product.productVariations != null) {
          for (int j = 0; j < product.productVariations!.length; j++) {
            final varient = product.productVariations![j];

            final file = await getDataFromAssets(varient.image);
            final url = await uploadImages(
                file, 'Products/${product.id}', varient.image);
            product.productVariations![j].image = url;
          }
        }

        final thumnailFile = await getDataFromAssets(product.thumbnail);
        final url = await uploadImages(
            thumnailFile, 'Products/${product.id}', product.thumbnail);
        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          for (int k = 0; k < product.images!.length; k++) {
            final image = product.images![k];
            final imageFile = await getDataFromAssets(image);
            final url =
                await uploadImages(imageFile, 'Products/${product.id}', image);
            product.images![k] = url;
          }
        }

        if (product.brand != null) {
          final file = await getDataFromAssets(product.brand!.image);
          final url = await uploadImages(file, 'Brands', product.brand!.image);
          product.brand!.image = url;
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
