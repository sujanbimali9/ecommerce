import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final products = snapshot.docs.map((e) {
        return ProductModel.fromJson(e.data());
      }).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
